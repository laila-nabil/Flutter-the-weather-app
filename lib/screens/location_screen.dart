import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: TextField(
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
