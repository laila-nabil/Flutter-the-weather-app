import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CompareWeather extends StatelessWidget {
  final String compareWeather;

  const CompareWeather({Key? key, required this.compareWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        height: constraints.maxHeight * 0.9,
        width: constraints.maxWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
            vertical: constraints.maxHeight * 0.05),
        child: AutoSizeText(
          compareWeather,
          minFontSize: 15,
          maxFontSize: 35,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          textAlign: TextAlign.center,
        ),
      );
    });
  }
}
