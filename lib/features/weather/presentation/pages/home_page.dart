import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';

import '../../../../core/localization/localization.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/unit.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../../domain/use_cases/get_weather_timeline_use_case.dart';
import '../bloc/weather_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>(),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<WeatherBloc>(context);
          final locationBloc = BlocProvider.of<LocationBloc>(context);
          if (state.weatherStatus == WeatherStatus.initial) {
            var long = locationBloc.location?.lon ?? "";
            var lat = locationBloc.location?.lat ?? "";
            var getCurrentLangCode = LocalizationImpl().getCurrentLangCode(context);
            var unit = UnitGroup.metric;
            bloc.add(InitialWeatherEvent(
                getTodayOverviewParams: GetTodayOverviewParams(
                    longitude: long,
                    latitude: lat,
                    language: getCurrentLangCode,
                    unit: unit),
                weatherTimelineParams: WeatherTimelineParams(
                    longitude: long,
                    latitude: lat,
                    language: getCurrentLangCode,
                    unit: unit,
                    daysAfterToday: 1,
                    daysBeforeToday: 1)));
          }
          return Scaffold(
            body: Center(
                child: Column(
                  children: [
                    Text(
              "${state.todayOverview}",
              style: TextStyle(color: Colors.black),
            ),
                    Text(
                      "${state.weatherTimeline}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
