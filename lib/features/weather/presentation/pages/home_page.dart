import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/language/presentation/manager/language_notifier.dart';
import 'package:the_weather_app/features/location/presentation/manager/location_notifier.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:the_weather_app/features/weather/presentation/manager/weather_notifier.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/weather_today.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_paths.dart';
import '../../../location/presentation/widgets/location_widget.dart';
import '../widgets/compare_weather.dart';
import '../widgets/weather_tabs.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add MetaSEO just into Web platform condition
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.ogTitle(ogTitle: 'Compare weather app');
      meta.twitterTitle(twitterTitle: 'Compare weather app');
      meta.description(
          description: 'Weather app with forecasting and history data');
      meta.ogDescription(
          ogDescription: 'Weather app with forecasting and history data');
      meta.twitterDescription(
          twitterDescription: 'Weather app with forecasting and history data');
      meta.keywords(
          keywords:
              'Weather, History weather, Future weather, Compare weather,Flutter');
    }

    // ignore: unused_local_variable
    final languageWatch = ref.watch(languageNotifierProvider);
    final locationWatch = ref.watch(locationNotifierProvider);
    final locationRead = ref.read(locationNotifierProvider);
    final weatherWatch = ref.watch(weatherNotifierProvider);
    printDebug("locationWatch.value ${locationWatch.value}");

    ref.listen(languageNotifierProvider, (prev, current) {
      var long = locationRead.value?.userCurrentLocation.lon ?? "";
      var lat = locationRead.value?.userCurrentLocation.lat ?? "";
      getWeatherData(
        ref: ref,
        longitude: long.toString(),
        latitude: lat.toString(),
        timezone: locationRead.value?.userCurrentLocation.timezone ?? "",
      );
    });
    ref.listen(locationNotifierProvider, (prev, current) {
      var long = current.value?.userCurrentLocation.lon ?? "";
      var lat = current.value?.userCurrentLocation.lat ?? "";
      ref
          .read(languageNotifierProvider.notifier)
          .selectLanguage(LocalizationImpl().getCurrentLanguagesEnum(context)!);
      getWeatherData(
        ref: ref,
        longitude: long.toString(),
        latitude: lat.toString(),
        timezone: current.value?.userCurrentLocation.timezone ?? "",
      );
    });
    ref.listen(weatherNotifierProvider, (_, __) => {},
        onError: (error, stacktrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text((error as Failure).message))));
    return weatherWatch.maybeWhen(
        data: (weatherState) {
          final mediaQuery = MediaQuery.of(context);
          final screenSize = mediaQuery.size;
          final isPortrait = screenSize.width < screenSize.height;
          return buildSafeArea(
              locationWatch, ref, weatherState, screenSize, isPortrait);
        },
        orElse: () {
          final mediaQuery = MediaQuery.of(context);
          final screenSize = mediaQuery.size;
          final isPortrait = screenSize.width < screenSize.height;
          return buildSafeArea(
              locationWatch, ref, weatherWatch.value, screenSize, isPortrait);
        },
        loading: () => Scaffold(body: const LoadingLogo()),
        skipError: true);
  }

  SafeArea buildSafeArea(AsyncValue<LocationState?> locationWatch, WidgetRef ref,
      WeatherEntity? weatherState, Size screenSize, bool isPortrait) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        body: RefreshIndicator(
          onRefresh: () async {
            var long = locationWatch.value?.userCurrentLocation.lon ?? "";
            var lat = locationWatch.value?.userCurrentLocation.lat ?? "";
            getWeatherData(
              ref: ref,
              longitude: long.toString(),
              latitude: lat.toString(),
              timezone: locationWatch.value?.userCurrentLocation.timezone ?? "",
            );
          },
          child: HomeLoadedContent(
            city: locationWatch.value?.userCurrentLocation.city ?? "",
            weather: weatherState,
            screenSize: screenSize,
            isPortrait: isPortrait,
          ),
        ),
      ),
    );
  }

  void getWeatherData(
      {required WidgetRef ref,
      required String longitude,
      required String latitude,
      required String timezone}) {
    ref.read(weatherNotifierProvider.notifier).getWeatherEvent(
        GetWeatherParams(lat: latitude, lon: longitude, timezone: timezone));
  }
}

class LoadingLogo extends StatefulWidget {
  const LoadingLogo({Key? key}) : super(key: key);

  @override
  State<LoadingLogo> createState() => _LoadingLogoState();
}

class _LoadingLogoState extends State<LoadingLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 1, milliseconds: 500),
        vsync: this,
        value: 0.5,
        lowerBound: 0.4,
        upperBound: 0.5)
      ..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(AppAssets.appLogo),
    );
  }
}

class HomeLoadedContent extends StatelessWidget {
  const HomeLoadedContent({
    Key? key,
    required this.screenSize,
    required this.isPortrait,
    required this.weather,
    required this.city,
  }) : super(key: key);

  final Size screenSize;
  final bool isPortrait;
  final WeatherEntity? weather;
  final String city;

  @override
  Widget build(BuildContext context) {
    int? todayIndex = weather?.days.indexWhere((element) {
          return element.date.isSameDay(DateTime.now());
        }) ??
        3;
    if (todayIndex < 0) {
      todayIndex = 3;
    }
    printDebug("todayIndex $todayIndex");
    var sunrise = DateTime.tryParse(
        weather?.dailyHourlyList.tryElementAt(0)!.dailyEntity.sunrise ?? "");
    var sunset = DateTime.tryParse(
        weather?.dailyHourlyList.tryElementAt(0)!.dailyEntity.sunset ?? "");
    final weatherTodayWidget = WeatherTodayWidget(
      weatherTodayDetails: WeatherTodayDetails(
          sunrise:
              sunrise == null ? "" : DateFormat('hh mm aa').format(sunrise),
          sunset: sunset == null ? "" : DateFormat('hh mm aa').format(sunset),
          iconPath: AppAssets.getIconPath(
              weather?.currentWeatherEntity?.weatherCode,
              weather?.currentWeatherEntity?.isDay),
          currentTemp:
              (weather?.currentWeatherEntity?.temperature ?? "").toString(),
          windDirection:
              (weather?.currentWeatherEntity?.windDirection ?? "").toString(),
          windSpeed:
              (weather?.currentWeatherEntity?.windSpeed ?? "").toString(),
          description: "",
          feelsLike: (weather?.dailyHourlyList
                      ?.tryElementAt(1)
                      ?.hourlyList
                      .where((element) =>
                          element.time == weather?.currentWeatherEntity?.time)
                      .tryFirst
                      ?.apparent_temperature ??
                  "")
              .toString(),
          rain: (weather?.dailyHourlyList
                      .tryElementAt(0)
                      ?.dailyEntity
                      .precipitationProbabilityMax ??
                  "")
              .toString(),
          todayMax:
              (weather?.dailyHourlyList.tryElementAt(0)?.dailyEntity.temperature2mMax ?? "")
                  .toString(),
          todayMin:
              (weather?.dailyHourlyList.tryElementAt(0)?.dailyEntity.temperature2mMin ?? "")
                  .toString()),
    );
    final compareWeather =
        CompareWeather(compareWeather: weather?.compareTodayYesterday ?? "");
    return SizedBox(
      height: screenSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: LocationWidget(
                city: city,
              )),
          if (isPortrait)
            Expanded(
                flex: 9,
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        items: [weatherTodayWidget, compareWeather],
                        options: CarouselOptions(
                          height: constraints.maxHeight - 0.1,
                          autoPlayInterval: const Duration(seconds: 10),
                          initialPage: 0,
                          autoPlay: true,
                          viewportFraction: 1,
                        )),
                  );
                }))
          else
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 6, child: weatherTodayWidget),
                    Expanded(
                      flex: 6,
                      child: compareWeather,
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
              // flex: isPortrait ? 4 : 5,
              flex: isPortrait ? 4 : 5,
              child: Padding(
                padding: isPortrait
                    ? const EdgeInsets.only(top: 8.0)
                    : const EdgeInsets.only(top: 30.0),
                child: weather?.days == null
                    ? Container()
                    : WeatherTabs(
                        days: weather!.days,
                      ),
              )),
          if (isPortrait)
            Text(
              '${'last_update'.tr().toString()} ${DateFormat('dd MMM - hh:mm a', 'locale'.tr().toString()).format(DateTime.now())}',
              style: const TextStyle(fontSize: 11, color: AppColors.white),
            )
        ],
      ),
    );
  }
}
