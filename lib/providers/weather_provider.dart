import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../models/weather.dart';
import '../models/current_weather.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> _pastWeather = [];
  List<Weather> _futureWeather = [];
  String _lat = '30.0444';//cairo's latitude
  String _lon = '31.2357';//cairo's longitude
  Weather _todayWeather;
  List<Weather> _hourlyPastWeather = [];
  List<Weather> _hourlyPresentFutureWeather = [];
  CurrentWeather _weatherNow;
  String _compareTodayYesterday = '';
  String location = '';
  static bool isImage3D = true;
  bool isLoading = false;
  static const terminalApi = String.fromEnvironment("api_key");
  var _API_KEY =
      kIsWeb ? terminalApi : dotenv.env['API_KEY'];

  int dateToUnixSeconds(int daysAgo, int hoursFromNextDay) {
    var timeNow = DateTime.now();
    // var timeNow = DateTime.now().toUtc();
    var unixTime = ((DateTime.utc(timeNow.year, timeNow.month, timeNow.day)
                .subtract(Duration(days: daysAgo, hours: hoursFromNextDay))
                .millisecondsSinceEpoch) /
            1000)
        .round();
    return unixTime;
  }

  DateTime unixSecondsToDate(int unixTimeStamp) {
    //If [isUtc] is false then the date is in the local time zone.
    return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  }
  DateTime unixSecondsToDateTimezone(int unixTimeStamp , int timezoneOffset) {
    //If [isUtc] is false then the date is in the local time zone.
    return DateTime.fromMillisecondsSinceEpoch((unixTimeStamp+timezoneOffset) * 1000,isUtc: true);
  }

  DateTime dateTimeTimezone(DateTime date , int timezoneOffset){
    return date.add(Duration(seconds: timezoneOffset));
  }

  Future<void> getCurrentWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    var API_key = _API_KEY;
    isLoading = true;
    // const lat = '30.0444';
    // const lon = '31.2357';
    // const part = 'minutely,hourly';
    const excludedPart = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$API_key';
    print('CurrentWeather url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      final currentWeather = json.decode(response.body);
      final iconNow = currentWeather['weather'][0]['icon'];
      _weatherNow = CurrentWeather(
        lat: lat,
        lon: lon,
        isImageNetwork: !isImage3D,
        image: isImage3D ? 'assets/3d/$iconNow.png': 'https://openweathermap.org/img/wn/$iconNow@4x.png',
        temp: currentWeather['main']['temp'].toString(),
        feelsLike: currentWeather['main']['feels_like'].toString(),
        mainDescription: currentWeather['weather'][0]['main'],
        detailedDescription: currentWeather['weather'][0]['description'],
        clouds: currentWeather['clouds']['all'].toString(),
        humidity: currentWeather['main']['humidity'].toString(),
        pressure: currentWeather['main']['pressure'].toString(),
        sunrise: currentWeather['sys']['sunrise'].toString(),
        sunset: currentWeather['sys']['sunset'].toString(),
        unixTime: currentWeather['dt'].toString(),
        windDeg: currentWeather['wind']['deg'].toString(),
        windSpeed: currentWeather['wind']['speed'].toString(),
        city: currentWeather['name'],
        country: currentWeather['sys']['country'],
        // rain:
      );
    } catch (error) {
      throw (error);
    }
    isLoading = false;

  }

  Future<void> getPresentFutureWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    var API_key = _API_KEY;
    isLoading = true;
    // const lat = '30.0444';
    // const lon = '31.2357';
    const excludedPart = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=$excludedPart&units=metric&appid=${API_key}';
    print('PresentFuture url is $url');
    try {
      _hourlyPresentFutureWeather = [];
      final response = await http.get(Uri.parse(url));
      final presentFutureWeather = json.decode(response.body);
      final date = presentFutureWeather['daily'][0]['dt'] as int;
      final iconNow = presentFutureWeather['current']['weather'][0]['icon'];
      final icon = presentFutureWeather['daily'][0]['weather'][0]['icon'];
      final List hourly = presentFutureWeather['hourly'];
      print('***hourly _hourlyPresentFutureWeather');
      hourly.forEach((element) {
        print('=>for element');
        print(element['weather'][0]['main']);
        print("day unixSecondsToDateTimezone: ${unixSecondsToDateTimezone(element['dt'],presentFutureWeather['timezone_offset'])}");
        _hourlyPresentFutureWeather.add(Weather(
            lat: lat,
            lon: lon,
            isImageNetwork: !isImage3D,
            image: isImage3D ? 'assets/3d/${element['weather'][0]['icon']}.png': 'https://openweathermap.org/img/wn/${element['weather'][0]['icon']}@4x.png',
            mainDescription: element['weather'][0]['main'],
            detailedDescription: element['weather'][0]['description'],
            date: unixSecondsToDate(element['dt']),
            // date: unixSecondsToDateTimezone(element['dt'],presentFutureWeather['timezone_offset']),
            rain: element['pop'].toString(),
            feelsLike: element['feels_like'].toString(),
            windSpeed: element['wind_speed'].toString(),
            windDeg: element['wind_deg'].toString(),
            humidity: element['humidity'].toString(),
            uvi: element['uvi'].toString(),
            clouds: element['clouds'].toString(),
            visibility: element['visibility'].toString(),
            pressure: element['pressure'].toString(),
            tempCurrent: element['temp'].toString()));
      });
      final todayHourly = _hourlyPresentFutureWeather.where((element) {
        int compare = DateFormat('MMM d yyyy')
            .format(DateTime.now())
            // .format(DateTime.now().toUtc())
            // .compareTo(DateFormat('MMM d yyyy').format(element.date.toUtc()));
            .compareTo(DateFormat('MMM d yyyy').format(element.date));
        print('todayHourly for element ${element.date} $compare');
        if (compare == 0) {
          return true;
        }
        return false;
      });
      print("todayHourly ${todayHourly.length} ${todayHourly}");
            _todayWeather = Weather(
          date: unixSecondsToDate(date),
          // date: unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']),
          tempMax: presentFutureWeather['daily'][0]['temp']['max'].toString(),
          tempMin: presentFutureWeather['daily'][0]['temp']['min'].toString(),
          lat: lat,
          lon: lon,
          mainDescription: presentFutureWeather['daily'][0]['weather'][0]
              ['main'],
          detailedDescription: presentFutureWeather['daily'][0]['weather'][0]
              ['description'],
                isImageNetwork: !isImage3D,
                image: isImage3D ? 'assets/3d/$icon.png': 'https://openweathermap.org/img/wn/$icon@4x.png',
          weatherTimeline: _hourlyPresentFutureWeather.where((element) =>
              DateFormat('yyyy-MM-dd')
                  // .format(DateTime.now().toUtc())
                  .format(DateTime.now())
                  .compareTo(DateFormat('yyyy-MM-dd').format(element.date.toUtc())) ==
              0).toList(),
            );
      await getLocationFromCoordinates();
      _futureWeather = [];
      for (int i = 1; i < 6; i++) {
        final date = presentFutureWeather['daily'][i]['dt'] as int;
        final icon = presentFutureWeather['daily'][i]['weather'][0]['icon'];
        _futureWeather.add(Weather(
            date: unixSecondsToDate(date),
          // date: unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']),
          tempMax: presentFutureWeather['daily'][i]['temp']['max'].toString(),
            tempMin: presentFutureWeather['daily'][i]['temp']['min'].toString(),
            lat: lat,
            lon: lon,
            mainDescription: presentFutureWeather['daily'][i]['weather'][0]
                ['main'],
            detailedDescription: presentFutureWeather['daily'][i]['weather'][0]
                ['description'],
            isImageNetwork: !isImage3D,
            image: isImage3D ? 'assets/3d/$icon.png': 'https://openweathermap.org/img/wn/$icon@4x.png',
            weatherTimeline: _hourlyPresentFutureWeather.where((element) {
              print("weather Timeline ${element.date} $date ${unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset'])}");
              print("weather Timeline ${DateFormat('yyyy-MM-dd')
                  .format(element.date)
                  .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']))) }");
              return DateFormat('yyyy-MM-dd')
                  .format(element.date)
                  .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDate(date))) ==
                  // .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']))) ==
                  0;
            }
            ).toList(),
        ));
      }
    } catch (error) {
      throw (error);
    }
    isLoading = false;

  }

  Future<void> getHistoryWeatherAPI(int daysAgo) async {
    // var API_key = DotEnv.env['API_KEY'];
    // var API_key = dotenv.env['API_KEY'];
    var API_key = _API_KEY;
    // const lat = '30.0444';
    // const lon = '31.2357';
    const part = 'current,minutely';
    var unixTimestamp = dateToUnixSeconds(daysAgo, 0);
    print('nightTime $unixTimestamp');
    var url =
        'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=$lat&lon=$lon&dt=$unixTimestamp&exclude=$part&units=metric&appid=${API_key}';

    print('history url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      print('daysAgo $daysAgo');
      final historyWeather = json.decode(response.body);
      print('historyWeather $historyWeather');
      List<dynamic> hourlyPast = json.decode(response.body)['hourly'];
      print(
          'json.decode(response.body)[hourly] ${json.decode(response.body)['hourly'].runtimeType}');
      print('***hourly history');
      //FIXME
      hourlyPast.forEach((element) {
        print('for element');
        print(element['weather'][0]['main']);
        print(unixSecondsToDateTimezone(element['dt'],historyWeather['timezone_offset']));
        _hourlyPastWeather.add(Weather(
            lat: lat,
            lon: lon,
            isImageNetwork: !isImage3D,
            image: isImage3D ? 'assets/3d/${element['weather'][0]['icon']}.png': 'https://openweathermap.org/img/wn/${element['weather'][0]['icon']}@4x.png',
            mainDescription: element['weather'][0]['main'].toString(),
            detailedDescription: element['weather'][0]['description'].toString(),
            humidity: element['humidity'].toString(),
            feelsLike: element['feels_like'].toString(),
            uvi: element['uvi'].toString(),
            clouds: element['clouds'].toString(),
            windDeg: element['wind_deg'].toString(),
            windSpeed: element['wind_speed'].toString(),
            pressure: element['pressure'].toString(),
            visibility: element['visibility'].toString(),
            date: unixSecondsToDate(element['dt']),
            // date:unixSecondsToDateTimezone(element['dt'],historyWeather['timezone_offset']),
            rain: "0.0",
            tempCurrent: element['temp'].toString()));
      });
      List<double> hourlyPastTemp = [];
      List<double> hourlyPastTempSorted = [];
      hourlyPast.forEach((value) {
        {
          print('adding > $value ${value.runtimeType}');
          double valueDouble = value['temp'] + 0.0;
          print('value[temp] ${value['temp']} ${value['temp'].runtimeType}');
          hourlyPastTemp.add(valueDouble);
        }
      });
      hourlyPastTempSorted = hourlyPastTemp;
      hourlyPastTempSorted.sort();
      print(
          'at $unixTimestamp : min temp ${hourlyPastTempSorted[0]}, max temp ${hourlyPastTempSorted[hourlyPastTempSorted.length - 1]}');
      _pastWeather.insert(
          daysAgo - 1,
          Weather(
            date: DateTime.now().subtract(Duration(days: daysAgo)),
            // date: DateTime.now().toUtc().subtract(Duration(days: daysAgo)),
            lat: lat,
            lon: lon,
            isMetric: true,
            isImageNetwork: false,
            tempMin: hourlyPastTempSorted[0].toString(),
            tempMax: hourlyPastTempSorted[hourlyPastTempSorted.length - 1]
                .toString(),
            weatherTimeline: _hourlyPastWeather.where((element) {
              print("weather Timeline past ${element.date} is ${daysAgo} days ago ? ${DateFormat('yyyy-MM-dd')
                  .format(element.date)
                  .compareTo(DateFormat('yyyy-MM-dd').format( DateTime.now().toUtc().subtract(Duration(days: daysAgo))))==0}");
              return (DateFormat('yyyy-MM-dd')
                  .format(element.date)
                  .compareTo(DateFormat('yyyy-MM-dd').format( DateTime.now().toUtc().subtract(Duration(days: daysAgo))))  == 0);
            }).toList(),
          ));
      print("<==>for ${_pastWeather[daysAgo-1].date} ${_pastWeather[daysAgo-1].weatherTimeline[0].tempCurrent}");
      print('end of api call $daysAgo');
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getWeather() async {
    print('getWeather');
    try {
      await getCurrentWeatherAPI();
      await getPresentFutureWeatherAPI();
      await getAllHistoryWeather();
      print('got weather');
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getAllHistoryWeather() async {
    print('getAllHistoryWeather');
    isLoading = true;
    try {
      _pastWeather = [];
      _hourlyPastWeather = [];
      for (int i = 1; i <= 5; i++) {
        print('i $i');
        await getHistoryWeatherAPI(i);
      }
      final pastWeatherData = _pastWeather;
      _pastWeather = [...(_pastWeather.reversed)];
      final diffDay = double.parse(todayWeather.tempMax)  >
          double.parse(pastWeatherData[0].tempMax) ? "warmer" : "colder";
      final diffNight = double.parse(todayWeather.tempMin)  >
          double.parse(pastWeatherData[0].tempMin) ? "warmer" : "colder";
      final diffMax = double.parse(todayWeather.tempMax) -
          double.parse(pastWeatherData[0].tempMax);
      final diffMin = double.parse(todayWeather.tempMin) -
          double.parse(pastWeatherData[0].tempMin);
      _compareTodayYesterday = 'Today is $diffDay than yesterday by ${diffMax.toStringAsFixed(2)}°C at day and is $diffNight by ${diffMin.toStringAsFixed(2)}°C at night';
      notifyListeners();
      print('got weather');
    } catch (error) {
      throw (error);
    }
    isLoading = false;
  }

  String get compareTodayYesterday {
    return _compareTodayYesterday;
  }

  Weather get todayWeather {
    return _todayWeather;
  }

  List<Weather> get allWeather {
    return [..._pastWeather] + [_todayWeather] + [..._futureWeather];
  }

  List<Weather> get hourlyWeather {
    return [..._hourlyPastWeather.reversed] + [..._hourlyPresentFutureWeather];
  }

  List<Weather> get futureWeather {
    print('futureWeather length is ${_futureWeather.length}');
    return [..._futureWeather];
  }


  CurrentWeather get weatherNow {
    return _weatherNow;
  }

  List<Weather> get pastWeather {
    print('pastWeather length is ${_pastWeather.length}');
    return [..._pastWeather.reversed];
  }

  Future<void> setLocationLatLon()
  async{
    Position result;
    try{
      result = await _determinePosition();
      _lat = result.latitude.toString();
      _lon = result.longitude.toString();
      print("location : getting location $_lat $_lon");
      await getLocationFromCoordinates();
      await getCurrentWeatherAPI();
      await getPresentFutureWeatherAPI();
      await getAllHistoryWeather();
      notifyListeners();
    }catch(error){
      print('location : error $error');
      notifyListeners();
      return Future.error(error);
    }

  }

  String get lat{
    return _lat;
  }

  String get lon{
    return _lon;
  }

  Future<Map> getLocationFromCoordinates() async {
    var url =
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${_todayWeather.lat}&longitude=${_todayWeather.lon}&localityLanguage=en';
    final response = await http.get(Uri.parse(url));
    
    final locationDetails = json.decode(response.body);
    print('locationDetails $locationDetails');
    if (locationDetails != null) {
      location = '${locationDetails['city']},${locationDetails['countryCode']}';
    }
    notifyListeners();
    return locationDetails;
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print("location : error('Location services are disabled.')");
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
        print("location : error('Location permissions are denied'')");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print("location : error('Location permissions are permanently denied')");

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    print("location : getting location");

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
