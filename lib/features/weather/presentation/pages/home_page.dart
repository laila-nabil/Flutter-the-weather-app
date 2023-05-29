import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_today_weather_overview_use_case.dart';
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
          var getCurrentLangCode =
          LocalizationImpl().getCurrentLangCode(context);
          var unit = UnitGroup.metric;
          getWeatherData(
              weatherBloc,
              long.toString(),
              lat.toString(),
              locationBloc.state.userCurrentLocation?.city ?? "",
              getCurrentLangCode,
              unit);
          },
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
            final weatherBloc = BlocProvider.of<WeatherBloc>(context);
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            if (locationState.status == LocationStatus.initial) {
              locationBloc.add(LocationInitialEvent());
            } else if (locationState.status == LocationStatus.success &&
                locationState.userCurrentLocation != null) {
              var long = locationBloc.state.userCurrentLocation?.lon ?? "";
              var lat = locationBloc.state.userCurrentLocation?.lat ?? "";
              var getCurrentLangCode =
                  LocalizationImpl().getCurrentLangCode(context);
              var unit = UnitGroup.metric;
              getWeatherData(
                  weatherBloc,
                  long.toString(),
                  lat.toString(),
                  locationBloc.state.userCurrentLocation?.city ?? "",
                  getCurrentLangCode,
                  unit);
            }
            return BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {},
              builder: (context, state) {
                final bloc = BlocProvider.of<WeatherBloc>(context);
                final locationBloc = BlocProvider.of<LocationBloc>(context);
                final languageBloc = BlocProvider.of<LanguageBloc>(context);
                if (state.weatherStatus == WeatherStatus.initial &&
                    (locationState).userCurrentLocation != null) {
                  var long = locationBloc.state.userCurrentLocation?.lon ?? "";
                  var lat = locationBloc.state.userCurrentLocation?.lat ?? "";
                  var getCurrentLangCode =
                      LocalizationImpl().getCurrentLangCode(context);
                  languageBloc.add(SelectLanguage(
                      LocalizationImpl().getCurrentLanguagesEnum(context)!));
                  var unit = UnitGroup.metric;
                  getWeatherData(
                      bloc,
                      long.toString(),
                      lat.toString(),
                      locationBloc.state.userCurrentLocation?.city ?? "",
                      getCurrentLangCode,
                      unit);
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
                const minimalView = true;
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
                        var long =
                            locationBloc.state.userCurrentLocation?.lon ?? "";
                        var lat =
                            locationBloc.state.userCurrentLocation?.lat ?? "";
                        var getCurrentLangCode =
                            LocalizationImpl().getCurrentLangCode(context);
                        var unit = UnitGroup.metric;
                        bloc.add(GetTodayOverview(
                            params: GetTodayOverviewParams(
                                longitude: long.toString(),
                                latitude: lat.toString(),
                                language: getCurrentLangCode,
                                unit: unit)));
                      },
                      child: state.weatherStatus == WeatherStatus.loading
                          ? const LoadingLogo()
                          : HomeLoadedContent(
                              city: locationBloc
                                      .state.userCurrentLocation?.city ??
                                  "",
                              locationBloc: locationBloc,
                              weatherBloc: bloc,
                              screenSize: screenSize,
                              isPortrait: isPortrait,
                              minimalView: minimalView),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void getWeatherData(WeatherBloc bloc, String longitude, String latitude,
      String city, String getCurrentLangCode, UnitGroup unit) {
    bloc.add(InitialWeatherEvent(
        getPresentFutureWeatherParams: GetPresentFutureWeatherParams(
            getCurrentLangCode,
            latitude: latitude,
            longitude: longitude),
        getHistoryListWeatherParams: GetHistoryListWeatherParams(
            latitude: latitude,
            longitude: longitude,
            language: getCurrentLangCode,
            numOfDays: bloc.numOfHistoryDays),
        getTodayOverviewParams: GetTodayOverviewParams(
            latitude: latitude,
            longitude: longitude,
            language: getCurrentLangCode)));
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
    required this.minimalView,
    required this.weatherBloc,
    required this.locationBloc,
    required this.city,
  }) : super(key: key);

  final Size screenSize;
  final bool isPortrait;
  final bool minimalView;
  final WeatherBloc weatherBloc;
  final String city;
  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
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
          if (isPortrait && minimalView)
            Expanded(
                flex: 9,
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        items: [
                          WeatherTodayWidget(
                            weatherToday_: weatherBloc
                                .state.presentFutureWeather?.daily.tryFirst,
                            weatherToday: weatherBloc.state.todayOverview,
                          ),
                          CompareWeather(
                              compareWeather:
                                  weatherBloc.state.compareTodayYesterday ?? "")
                        ],
                        options: CarouselOptions(
                          height: constraints.maxHeight - 0.1,
                          autoPlayInterval: const Duration(seconds: 10),
                          initialPage: 0,
                          autoPlay: true,
                          viewportFraction: 1,
                        )),
                  );
                })),
          if (isPortrait && !minimalView)
            Expanded(
                flex: 7,
                child: WeatherTodayWidget(
                  weatherToday_:
                      weatherBloc.state.presentFutureWeather!.daily.tryFirst!,
                  weatherToday: weatherBloc.state.todayOverview!,
                )),
          if (isPortrait && !minimalView)
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompareWeather(
                      compareWeather:
                          weatherBloc.state.compareTodayYesterday ?? "")),
            ),
          if (!isPortrait)
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 6,
                        child: WeatherTodayWidget(
                          weatherToday: weatherBloc.state.todayOverview,
                          weatherToday_: weatherBloc
                              .state.presentFutureWeather?.daily.tryFirst,
                        )),
                    Expanded(
                      flex: 6,
                      child: CompareWeather(
                          compareWeather:
                              weatherBloc.state.compareTodayYesterday ?? ""),
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
                child: WeatherTabs(
                  days: weatherBloc.state.days,
                  numOfHistoryDays:
                      weatherBloc.state.historyListWeather?.length ?? 0,
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
