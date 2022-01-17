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
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 6.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff2d3647)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(Icons.search , color: Colors.white,),
                            SizedBox(width: 4,),
                            Text('Add Location'),
                          ],
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        fillColor: Colors.purple),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
