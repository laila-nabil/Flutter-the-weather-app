import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cron/cron.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/presentation/widgets/location_widget.dart';
import 'package:universal_html/html.dart' as html;

import '../../../../injection_container.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../../domain/entities/current_weather.dart';
import '../../domain/entities/weather.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/compare_weather.dart';
import '../widgets/weather_tabs.dart';
import '../widgets/weather_today.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  static const bool _isShimmer = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>(),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final weatherBloc = BlocProvider.of<WeatherBloc>(context);
          final languageBloc = BlocProvider.of<LanguageBloc>(context);
          if (state is WeatherInitial) {
            var language = LocalizationImpl().getCurrentLanguagesEnum(context) ??
                    languagesEnum.en;
            printDebug("selectedLangEnum WeatherInitial $language");
            languageBloc.add(SelectLanguage(
                language));
            weatherBloc.add(WeatherInitialEvent());
          }
          final mediaQuery = MediaQuery.of(context);
          final screenSize = mediaQuery.size;
          final orientation = mediaQuery.orientation;
          final isPortrait = screenSize.width < screenSize.height;
          final minimalView = true;
          final userAgent =
              html.window.navigator.userAgent.toString().toLowerCase();
          //printDebug('userAgent $userAgent');
          //printDebug("screenSize $screenSize");
          //printDebug("orientation $orientation");
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
                  weatherBloc.add(WeatherRefreshEvent());
                },
                child: SingleChildScrollView(
                    // physics: AlwaysScrollableScrollPhysics(),
                    // physics: ,
                    // padding: const EdgeInsets.all(18.0),
                    child: state is WeatherLoading
                        ? _isShimmer
                            ? (userAgent.contains('iphone')
                                ? loadingShimmerIos(screenSize: screenSize)
                                : loadingShimmer(screenSize: screenSize))
                            : loadingLogo()
                        : LoadedContent(
                            weatherBloc: weatherBloc,
                            screenSize: screenSize,
                            isPortrait: isPortrait,
                            minimalView: minimalView)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class loadingLogo extends StatefulWidget {
  const loadingLogo({Key? key}) : super(key: key);

  @override
  State<loadingLogo> createState() => _loadingLogoState();
}

class _loadingLogoState extends State<loadingLogo>
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

class loadingShimmer extends StatelessWidget {
  const loadingShimmer({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    //printDebug('userAgent $userAgent');
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenSize.width * 0.55,
            height: screenSize.height * 0.05,
            child: Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDesign.borderRadius3),
                    color: AppColors.white.withOpacity(0.37)),
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: screenSize.height * 0.57,
            child: Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDesign.mainBorderRadius),
                    color: AppColors.white.withOpacity(0.37)),
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
        ),
      ],
    );
  }
}

class loadingShimmerIos extends StatefulWidget {
  const loadingShimmerIos({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<loadingShimmerIos> createState() => _loadingShimmerIosState();
}

class _loadingShimmerIosState extends State<loadingShimmerIos>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; //controller
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true); //
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    super.initState();
  }

  //
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.screenSize.width * 0.55,
              height: widget.screenSize.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.borderRadius3),
                  color: AppColors.white.withOpacity(0.3)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // width: screenSize.width * 0.99,
              height: widget.screenSize.height * 0.57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.borderRadius3),
                  color: AppColors.white.withOpacity(0.3)),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadedContent extends StatelessWidget {
  const LoadedContent({
    Key? key,
    required this.screenSize,
    required this.isPortrait,
    required this.minimalView,
    required this.weatherBloc,
  }) : super(key: key);

  final Size screenSize;
  final bool isPortrait;
  final bool minimalView;
  final WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: LocationWidget(
                city: weatherBloc.locationBloc.location?.city ?? "",
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
                              weatherToday: weatherBloc.currentWeather,
                              weatherTodayNotDetailed: weatherBloc
                                  .presentFutureWeather.tryFirst ?? Weather()),
                          CompareWeather()
                        ],
                        options: CarouselOptions(
                          height: constraints.maxHeight - 0.1,
                          autoPlayInterval: Duration(seconds: 10),
                          initialPage: 0,
                          autoPlay: true,
                          viewportFraction: 1,
                        )),
                  );
                })),
          if (isPortrait && !minimalView)
            Expanded(flex: 7, child: WeatherTodayWidget(
                weatherToday: weatherBloc.currentWeather!,
                weatherTodayNotDetailed: weatherBloc
                    .presentFutureWeather
                !.elementAt(0))),
          if (isPortrait && !minimalView)
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CompareWeather(),
              ),
            ),
          if (!isPortrait)
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(flex: 6, child: WeatherTodayWidget(
                        weatherToday: weatherBloc.currentWeather,
                        weatherTodayNotDetailed:weatherBloc
                            .presentFutureWeather?.first ?? Weather())),
                    Expanded(
                      flex: 6,
                      child: CompareWeather(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
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
                    : const EdgeInsets.only(top: 16.0),
                child: WeatherTabs(),
              )),
          if (isPortrait)
            Expanded(
              flex: 1,
              child: Text(
                '${'last_update'.tr().toString()} ${DateFormat('dd MMM - hh:mm a', 'locale'.tr().toString()).format(DateTime.now())}',
                style: TextStyle(fontSize: 11, color: AppColors.white),
              ),
            )
        ],
      ),
    );
  }
}

class todayOverview extends StatelessWidget {
  final bool portrait;
  final WeatherBloc weatherBloc;

  todayOverview(this.portrait, {required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    return !portrait
        ? Row(
            children: [
              SizedBox.expand(child: WeatherTodayWidget(
                  weatherToday: weatherBloc.currentWeather!,
                  weatherTodayNotDetailed: weatherBloc
                      .presentFutureWeather
                  !.elementAt(0))),
              SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompareWeather(),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(flex: 7, child: WeatherTodayWidget(weatherToday: weatherBloc.currentWeather!,
                  weatherTodayNotDetailed: weatherBloc
                      .presentFutureWeather
                  !.elementAt(0))),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompareWeather(),
                ),
              ),
            ],
          );
  }
}

List<Widget> weatherTodayOverview (WeatherBloc weatherBloc){
  return [
    Container(child: WeatherTodayWidget(weatherToday: weatherBloc.currentWeather!,
        weatherTodayNotDetailed: weatherBloc
            .presentFutureWeather
        !.elementAt(0))),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CompareWeather(),
    ),
  ];
}

void cronSchedule(
    {dynamic repeatedAction,
    String minute = '*',
    String hour = '*',
    String day = '*',
    String month = '*',
    String dayWeek = '*'}) {
  //https://crontab.guru/#01_00_*_*_*
  final cron = Cron();
  final time = '$minute $hour $day $month $dayWeek';
  //printDebug('time is >$time>');
  //printDebug('Alarm set');
  cron.schedule(Schedule.parse(time), () async {
    //printDebug(
    //     '$minute minutes,$hour hours,$day days,$month month,$dayWeek day week ${DateTime.now()}');
    repeatedAction;
    //printDebug('Alarm done');
  });
}

void newRefresh({dynamic repeatedAction}) {
  cronSchedule(repeatedAction: repeatedAction, minute: '*/39');
}
