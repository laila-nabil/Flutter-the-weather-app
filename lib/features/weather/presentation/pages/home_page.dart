import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';

import '../../../../core/localization/localization.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/unit.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../bloc/weather_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = "/";
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
          if(state.weatherStatus == WeatherStatus.initial){
            bloc.add(GetTodayOverview(params: GetTodayOverviewParams(
              longitude: locationBloc.location?.lon??"",
              latitude: locationBloc.location?.lat??"",
              language:LocalizationImpl().getCurrentLangCode(context) ,
              unit: UnitGroup.metric
            )));
          }
          if(state.todayOverview!=null){
            return Scaffold(
              body: Text(state.todayOverview.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
