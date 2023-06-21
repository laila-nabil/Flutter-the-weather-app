import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/location/presentation/pages/location_screen.dart';
import 'package:the_weather_app/features/settings/presentation/pages/settings_screen.dart';

class LocationWidget extends StatelessWidget {
  final String city;
  final LocationBloc locationBloc;

  const LocationWidget(
      {Key? key, required this.city, required this.locationBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            // vertical: constraints.maxHeight * 0.2,
            horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                },
                iconSize: min(constraints.maxHeight * 0.7, 30),
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.white,
                  // size: constraints.maxHeight * 0.7,
                )),
            Expanded(
              // width: constraints.maxWidth *0.4,
              // height:constraints.maxHeight * 0.6 ,
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    city,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    minFontSize: 10.0,
                    maxFontSize: 20.0,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: () {
                        locationBloc.add(const SetLocation());
                      },
                      iconSize: constraints.maxHeight * 0.4,
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minWidth: kMinInteractiveDimension,
                        minHeight: kMinInteractiveDimension,
                      ),
                      icon: const Icon(
                        Icons.my_location,
                        color: AppColors.white,
                      )),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LocationScreen.routeName,);
                },
                iconSize: min(constraints.maxHeight * 0.7, 30),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minWidth: kMinInteractiveDimension,
                  minHeight: kMinInteractiveDimension,
                ),
                icon: const Icon(
                  Icons.search,
                  color: AppColors.white,

                  // size: constraints.maxHeight * 0.7,
                )),
          ],
        ),
      );
    });
  }
}
