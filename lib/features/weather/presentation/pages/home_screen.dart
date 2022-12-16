import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/weather_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

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
          if(state is WeatherInitial){
            weatherBloc.add(WeatherInitialEvent());
          }
          return Container();
        },
      ),
    );
  }
}
