import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';

class frostedGlassEffect extends StatelessWidget {
  final BuildContext context;
  final Widget widget;
  final double height;
  final double width;

  const frostedGlassEffect(
      {Key? key, required this.context, required this.widget, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDesign.mainBorderRadius),
        child: Container(
          child: Stack(children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Container(
                height: height - 10,
                width: width,
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                    )
                  ],
                  border: Border.all(
                      color: AppColors.white.withOpacity(0.2), width: 1.0),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.white.withOpacity(0.5),
                      AppColors.white.withOpacity(0.2)
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(AppDesign.mainBorderRadius)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: widget,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
