import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';

import '../../../../core/constants.dart';
import '../../../../main.dart';

class GetCurrentLocationUseCase implements UseCase<LocationEntity,NoParams>{
  @override
  Future<Either<Failure, LocationEntity>> call(NoParams params) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      //printDebug("location : error('Location services are disabled.')");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        //printDebug("location : error('Location permissions are denied'')");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      //printDebug("location : error('Location permissions are permanently denied')");

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    //printDebug("location : getting location");

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var position = await Geolocator.getCurrentPosition();
    if (enableAnalytics) {
      analytics.logEvent(name: "GetCurrentLocationUseCase");
    }
    return Right(LocationEntity(
        lon: position.longitude.toString(), lat: position.latitude.toString(),));
  }

}