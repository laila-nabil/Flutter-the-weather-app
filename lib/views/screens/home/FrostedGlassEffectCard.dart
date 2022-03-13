import 'dart:ui';

import 'package:flutter/material.dart';

class frostedGlassEffect extends StatelessWidget {
  final BuildContext context;
  final Widget widget;
  final double height;
  final double width;

  const frostedGlassEffect(
      {Key key, this.context, this.widget, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
                      color: Colors.black.withOpacity(0.25),
                    )
                  ],
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20)),
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
