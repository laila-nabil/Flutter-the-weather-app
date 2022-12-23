import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';
import 'package:the_weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class CompareWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compareWeather = BlocProvider.of<WeatherBloc>(context).compareTodayYesterday;
        // Provider.of<WeatherProvider>(context).compareTodayYesterday;
    return LayoutBuilder(builder: (ctx, constraints) {
      return Card(
        // color: Color(0xff272F3A),
        color: AppColors.backgroundDarkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDesign.mainBorderRadius)),
        child: Container(
          height: constraints.maxHeight * 0.9,
          width: constraints.maxWidth * 0.9,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              // horizontal: constraints.maxWidth * 0.05,
              vertical: constraints.maxHeight * 0.05),
          child: AutoSizeText(
            compareWeather,
            minFontSize: 15,
            maxFontSize: 35,
            // softWrap: true,
            // maxLines: 3,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }
}
