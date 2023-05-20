import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';

class DashboardWeather extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  final String status;
  final bool isStatusCentered;

  DashboardWeather(
      {this.svgIcon, this.title, required this.status, required this.isStatusCentered});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Row(
        children: [
          if (svgIcon != null)
            Expanded(
              child: SvgPicture.asset(
                svgIcon!,
                // width: 22,
                // height: 22,
                color: AppColors.white,
              ),
            ),
          if (title != null)
            Expanded(
              child: AutoSizeText(
                title!,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
              ),
            ),
          Expanded(
              child: AutoSizeText(
            status,
            textAlign: isStatusCentered ? TextAlign.center : TextAlign.left,
            maxLines: 1,
          ))
        ],
      );
    });
  }
}
