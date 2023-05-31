import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/weather_today.dart';

import '../../../../core/injection_container.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_paths.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../../../location/presentation/widgets/location_widget.dart';
import '../../domain/entities/unit.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/compare_weather.dart';
import '../widgets/weather_tabs.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
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

    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>(),
      child: BlocListener<LanguageBloc, LanguageState>(
        listener: (context, state) {
          final weatherBloc = BlocProvider.of<WeatherBloc>(context);
          final locationBloc = BlocProvider.of<LocationBloc>(context);
          printDebug("locationBloc.state ${locationBloc.state}");
          var long = locationBloc.state.userCurrentLocation?.lon ?? "";
          var lat = locationBloc.state.userCurrentLocation?.lat ?? "";
          getWeatherData(
              bloc: weatherBloc,
              longitude: long.toString(),
              latitude: lat.toString(),
              timezone: locationBloc.state.userCurrentLocation.timezone ?? "",);
        },
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
            final weatherBloc = BlocProvider.of<WeatherBloc>(context);
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            if (locationState.status == LocationStatus.initial) {
              locationBloc.add(LocationInitialEvent());
            } else if (locationState.status == LocationStatus.success) {
              var long = locationBloc.state.userCurrentLocation.lon ?? "";
              var lat = locationBloc.state.userCurrentLocation.lat ?? "";
              getWeatherData(
                bloc: weatherBloc,
                longitude: long.toString(),
                latitude: lat.toString(),
                timezone: locationBloc.state.userCurrentLocation.timezone ?? "",);
            }
            return BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {},
              builder: (context, state) {
                final bloc = BlocProvider.of<WeatherBloc>(context);
                final locationBloc = BlocProvider.of<LocationBloc>(context);
                final languageBloc = BlocProvider.of<LanguageBloc>(context);
                if (state.weatherStatus == WeatherStatus.initial) {
                  languageBloc.add(SelectLanguage(
                      LocalizationImpl().getCurrentLanguagesEnum(context)!));
                  var long = locationBloc.state.userCurrentLocation.lon ?? "";
                  var lat = locationBloc.state.userCurrentLocation.lat ?? "";
                  getWeatherData(
                    bloc: weatherBloc,
                    longitude: long.toString(),
                    latitude: lat.toString(),
                    timezone: locationBloc.state.userCurrentLocation.timezone ?? "",);
                }

                if (state.weatherStatus == WeatherStatus.loading) {
                  return Scaffold(
                    backgroundColor: Theme.of(context).backgroundColor,
                    body: const Center(child: CircularProgressIndicator()),
                  );
                }
                final mediaQuery = MediaQuery.of(context);
                final screenSize = mediaQuery.size;
                final isPortrait = screenSize.width < screenSize.height;
                return SafeArea(
                  bottom: true,
                  left: true,
                  top: true,
                  right: true,
                  maintainBottomViewPadding: true,
                  minimum: EdgeInsets.zero,
                  child: Scaffold(
                    backgroundColor: Theme.of(context).backgroundColor,
                    body: RefreshIndicator(
                      onRefresh: () async {
                        var long = locationBloc.state.userCurrentLocation.lon ?? "";
                        var lat = locationBloc.state.userCurrentLocation.lat ?? "";
                        getWeatherData(
                          bloc: weatherBloc,
                          longitude: long.toString(),
                          latitude: lat.toString(),
                          timezone: locationBloc.state.userCurrentLocation.timezone ?? "",);
                      },
                      child: state.weatherStatus == WeatherStatus.loading
                          ? const LoadingLogo()
                          : state.weatherStatus == WeatherStatus.success
                              ? HomeLoadedContent(
                                  city: locationBloc
                                          .state.userCurrentLocation?.city ??
                                      "",
                                  locationBloc: locationBloc,
                                  weatherBloc: bloc,
                                  screenSize: screenSize,
                                  isPortrait: isPortrait,)
                              : Container(),
                    ) ,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void getWeatherData({required WeatherBloc bloc, required String longitude, required String latitude,
     required String timezone}) {
    bloc.add(GetWeatherEvent(
        getWeatherParams: GetWeatherParams(
            lat: latitude,
            lon: longitude,
        timezone: timezone),));
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
    required this.weatherBloc,
    required this.locationBloc,
    required this.city,
  }) : super(key: key);

  final Size screenSize;
  final bool isPortrait;
  final WeatherBloc weatherBloc;
  final String city;
  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
    int todayIndex = weatherBloc.state.days.indexWhere((element) {
      printDebug("element.date ${element.date}");
      printDebug("element.date ${element.date.isSameDay(DateTime.now())}");
      return element.date.isSameDay(DateTime.now());
    });
    if (todayIndex < 0) {
      todayIndex = 3;
    }
    printDebug("todayIndex $todayIndex");
    final weatherTodayWidget = WeatherTodayWidget(
      weatherTodayDetails: WeatherTodayDetails(
          sunrise: DateFormat('hh mm aa').format(DateTime.parse(weatherBloc.state.weather?.dailyHourlyList
              .tryElementAt(0)
          !.dailyEntity
              .sunrise??"")),
          sunset: DateFormat('hh mm aa').format(DateTime.parse(weatherBloc.state.weather?.dailyHourlyList
              .tryElementAt(0)
          !.dailyEntity
              .sunset??"")),
          iconPath:  AppAssets.getIconPath(
              weatherBloc.state.weather?.currentWeatherEntity?.weatherCode,
              weatherBloc.state.weather?.currentWeatherEntity?.isDay),
          currentTemp:
              (weatherBloc.state.weather?.currentWeatherEntity?.temperature ?? "")
                  .toString(),
          windDirection:
              (weatherBloc.state.weather?.currentWeatherEntity?.windDirection ?? "")
                  .toString(),
          windSpeed:
              (weatherBloc.state.weather?.currentWeatherEntity?.windSpeed ??
                      "")
                  .toString(),
          description: "",
          feelsLike: (weatherBloc.state.weather?.dailyHourlyList
                      ?.elementAt(1)
                      .hourlyList
                      .firstWhere((element) {
                        printDebug("feels like * ${element.time}");
                        printDebug("feels like - ${weatherBloc.state.weather?.currentWeatherEntity?.time}");
                        return element.time ==
                          weatherBloc.state.weather?.currentWeatherEntity?.time;
                      })
                      .temperatureFeelsLike ??
                  "")
              .toString(),
          rain: (weatherBloc.state.weather?.dailyHourlyList
                      .tryElementAt(0)
                      ?.dailyEntity
                      .precipitationProbabilityMax ??
                  "")
              .toString(),
          todayMax: (weatherBloc.state.weather?.dailyHourlyList
                      .tryElementAt(0)
                      ?.dailyEntity
                      .temperature2mMax ??
                  "")
              .toString(),
          todayMin: (weatherBloc.state.weather?.dailyHourlyList
                      .tryElementAt(0)
                      ?.dailyEntity
                      .temperature2mMin ??
                  "")
              .toString()),
    );
    final compareWeather = CompareWeather(
        compareWeather:
        weatherBloc.state.compareTodayYesterday ?? "");
    return SizedBox(
      height: screenSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: LocationWidget(
                city: city,
                locationBloc: locationBloc,
              )),
          if (isPortrait)
            Expanded(
                flex: 9,
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        items: [
                          weatherTodayWidget,
                          compareWeather
                        ],
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
                    Expanded(
                        flex: 6,
                        child: weatherTodayWidget),
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
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    return WeatherTabs(
                      days: state.days,
                    );
                  },
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
