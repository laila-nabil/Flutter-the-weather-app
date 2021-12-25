import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../models/weather.dart';
import '../models/current_weather.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> _pastWeather = [];
  List<Weather> _futureWeather = [];
  Weather _todayWeather;
  List<Weather> _hourlyPastWeather = [];
  List<Weather> _hourlyPresentFutureWeather = [];
  List<List<Weather>> _weatherTabs =
      List.filled(0, List.filled(0, Weather(), growable: true), growable: true);
  CurrentWeather _weatherNow;
  String _compareTodayYesterday = '';
  String location = '';
  var _API_KEY =
      kIsWeb ? String.fromEnvironment("api_key") : dotenv.env['API_KEY'];

  int dateToUnixSeconds(int daysAgo, int hoursFromNextDay) {
    var timeNow = DateTime.now();
    var unixTime = ((DateTime.utc(timeNow.year, timeNow.month, timeNow.day)
                .subtract(Duration(days: daysAgo, hours: hoursFromNextDay))
                .millisecondsSinceEpoch) /
            1000)
        .round();
    return unixTime;
  }

  DateTime unixSecondsToDate(int unixTimeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  }

  Future<void> getCurrentWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    var API_key = _API_KEY;
    const lat = '30.0444';
    const lon = '31.2357';
    // const part = 'minutely,hourly';
    const excludedPart = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$API_key';
    print('CurrentWeather url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      final currentWeather = json.decode(response.body);
      // print('current');
      // print('lat $lat');
      // print('lon $lon');
      // print('temp ${currentWeather['current']['temp']}');
      // print('feelsLike ${currentWeather['current']['feels_like']}');
      // print('feelsLike ${currentWeather['current']['feels_like']}');
      // print('image https://openweathermap.org/img/wn/$iconNow@2x.png');
      final iconNow = currentWeather['weather'][0]['icon'];
      _weatherNow = CurrentWeather(
        lat: lat,
        lon: lon,
        isImageNetwork: true,
        image: 'https://openweathermap.org/img/wn/$iconNow@2x.png',
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
      );
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getPresentFutureWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    var API_key = _API_KEY;
    const lat = '30.0444';
    const lon = '31.2357';
    // const part = 'minutely,hourly';
    const excludedPart = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=$excludedPart&units=metric&appid=${API_key}';
    print('PresentFuture url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      final presentFutureWeather = json.decode(response.body);
      // print("_todayWeather time ${unixSecondsToDate(int.parse(presentFutureWeather['daily'][0]['dt']))}");
      print("_todayWeather time ${presentFutureWeather['daily'][0]['dt']}");
      final date = presentFutureWeather['daily'][0]['dt'] as int;
      print("_todayWeather time $date");
      print("_todayWeather time ${unixSecondsToDate(date)}");
      final iconNow = presentFutureWeather['current']['weather'][0]['icon'];
      print('current');
      print('lat $lat');
      print('lon $lon');
      print('temp ${presentFutureWeather['current']['temp']}');
      print('feelsLike ${presentFutureWeather['current']['feels_like']}');
      print('feelsLike ${presentFutureWeather['current']['feels_like']}');
      print('image https://openweathermap.org/img/wn/$iconNow@2x.png');
      _weatherNow.tempMin =
          presentFutureWeather['daily'][0]['temp']['min'].toString();
      _weatherNow.tempMax =
          presentFutureWeather['daily'][0]['temp']['max'].toString();
      final icon = presentFutureWeather['daily'][0]['weather'][0]['icon'];
      final List hourly = presentFutureWeather['hourly'];
      print('***hourly');
      hourly.forEach((element) {
        print('for element');
        print(element['weather'][0]['main']);
        print(unixSecondsToDate(element['dt']));
        _hourlyPresentFutureWeather.add(Weather(
          lat: lat,
          lon: lon,
          image: element['weather'][0]['icon'],
          mainDescription: element['weather'][0]['main'],
          detailedDescription: element['weather'][0]['description'],
          date: unixSecondsToDate(element['dt']),
        ));
      });
      // List<List<Weather>> weatherTabs= [[],[],[]];
      // List<List<Weather>> weatherTabs= List.filled(15, List.filled(24, Weather(),growable: true),growable: true);
      // // List<Weather> weatherTabs= weatherList;
      // _hourlyPresentFutureWeather.forEach((weatherByHour) {
      //   print('diff is ${weatherByHour.date.difference(DateTime.now()).inDays}');
      //   weatherTabs[weatherByHour.date.difference(DateTime.now()).inDays].add(weatherByHour);
      //   print('weatherTabs');
      //   print('weatherTabs.length ${weatherTabs.length}');
      //   print('weatherByHour.date.difference(DateTime.now()).inDays ${weatherByHour.date.difference(DateTime.now()).inDays}');
      //   print('weatherTabs[weatherByHour.date.difference(DateTime.now()).inDays].length ${weatherTabs[weatherByHour.date.difference(DateTime.now()).inDays].length}');
      // });

      _todayWeather = Weather(
          date: unixSecondsToDate(date),
          // date: DateTime.now(),
          tempMax: presentFutureWeather['daily'][0]['temp']['max'].toString(),
          tempMin: presentFutureWeather['daily'][0]['temp']['min'].toString(),
          lat: lat,
          lon: lon,
          mainDescription: presentFutureWeather['daily'][0]['weather'][0]
              ['main'],
          detailedDescription: presentFutureWeather['daily'][0]['weather'][0]
              ['description'],
          isImageNetwork: true,
          image: 'https://openweathermap.org/img/wn/$icon@4x.png');
      print('1 _futureWeather lenght ${_futureWeather.length}');
      await getLocationFromCoordinates();
      _futureWeather = [];
      print('2 _futureWeather lenght ${_futureWeather.length}');
      for (int i = 1; i < 6; i++) {
        final date = presentFutureWeather['daily'][i]['dt'] as int;
        final icon = presentFutureWeather['daily'][i]['weather'][0]['icon'];
        _futureWeather.add(Weather(
            date: unixSecondsToDate(date),
            tempMax: presentFutureWeather['daily'][i]['temp']['max'].toString(),
            tempMin: presentFutureWeather['daily'][i]['temp']['min'].toString(),
            lat: lat,
            lon: lon,
            mainDescription: presentFutureWeather['daily'][i]['weather'][0]
                ['main'],
            detailedDescription: presentFutureWeather['daily'][i]['weather'][0]
                ['description'],
            isImageNetwork: true,
            image: 'https://openweathermap.org/img/wn/$icon@4x.png'));
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getHistoryWeatherAPI(int daysAgo) async {
    // var API_key = DotEnv.env['API_KEY'];
    // var API_key = dotenv.env['API_KEY'];
    var API_key = _API_KEY;
    const lat = '30.0444';
    const lon = '31.2357';
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
      // final icon = presentFutureWeather['daily'][i]['weather'][0]['icon'];
      _pastWeather.insert(
          daysAgo - 1,
          Weather(
            date: DateTime.now().subtract(Duration(days: daysAgo)),
            lat: lat,
            lon: lon,
            isMetric: true,
            tempMin: hourlyPastTempSorted[0].toString(),
            tempMax: hourlyPastTempSorted[hourlyPastTempSorted.length - 1]
                .toString(),
          ));
      print('end of api call $daysAgo');
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getWeather() async {
    print('getting weather');
    try {
      await getPresentFutureWeatherAPI();
      _pastWeather = [];
      for (int i = 1; i <= 5; i++) {
        print('i $i');
        await getHistoryWeatherAPI(i);
      }
      _pastWeather = [...(_pastWeather.reversed)];
      final isHotterToday = (double.parse(todayWeather.tempMax) +
              double.parse(todayWeather.tempMin)) >
          (double.parse(_pastWeather[0].tempMax) +
              double.parse(_pastWeather[0].tempMin));
      final diffMax = double.parse(todayWeather.tempMax) -
          double.parse(_pastWeather[0].tempMax);
      final diffMin = double.parse(todayWeather.tempMin) -
          double.parse(_pastWeather[0].tempMin);
      final diff =
          '${diffMax.toStringAsFixed(2)} at day and ${diffMin.toStringAsFixed(2)} at night';
      _compareTodayYesterday = isHotterToday
          ? 'Today is warmer than yesterday by $diff'
          : 'Today is colder than yesterday by $diff';
      notifyListeners();
      print('got weather');
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getAllHistoryWeather() async {
    print('getting weather');
    try {
      _pastWeather = [];
      for (int i = 1; i <= 5; i++) {
        print('i $i');
        await getHistoryWeatherAPI(i);
      }
      _pastWeather = [...(_pastWeather.reversed)];
      final isHotterToday = (double.parse(todayWeather.tempMax) +
              double.parse(todayWeather.tempMin)) >
          (double.parse(_pastWeather[0].tempMax) +
              double.parse(_pastWeather[0].tempMin));
      final diffMax = double.parse(todayWeather.tempMax) -
          double.parse(_pastWeather[0].tempMax);
      final diffMin = double.parse(todayWeather.tempMin) -
          double.parse(_pastWeather[0].tempMin);
      final diff =
          '${diffMax.toStringAsFixed(2)} at day and ${diffMin.toStringAsFixed(2)} at night';
      _compareTodayYesterday = isHotterToday
          ? 'Today is warmer than yesterday by $diff'
          : 'Today is colder than yesterday by $diff';
      notifyListeners();
      print('got weather');
    } catch (error) {
      throw (error);
    }
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
    return [..._hourlyPastWeather] + [..._hourlyPresentFutureWeather];
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

  Future<Map> getLocationFromCoordinates() async {
    var url =
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${_todayWeather.lat}&longitude=${_todayWeather.lon}&localityLanguage=en';
    final response = await http.get(Uri.parse(url));
    final locationDetails = json.decode(response.body);
    print('locationDetails $locationDetails');
    if (locationDetails != null) {
      location = '${locationDetails['city']},${locationDetails['countryName']}';
    }
    notifyListeners();
    return locationDetails;
  }

  List<List<Weather>> get weatherTabs {
    final List<Weather> daily = [];
    for (int i = -5;i<11;i++){
      _hourlyPresentFutureWeather
          .where((element) => element.date.difference(DateTime.now()).inDays == i)
          .forEach((element) {
        daily.add(element);
        print('element ${element.date} added to $i');
      });
      print('daily length ${daily.length}');
      _weatherTabs.add(daily);
    }
    // allWeather.forEach((element) {
    //   int i = -5;
    //   if(element.date.difference(DateTime.now()).inDays == i)
    //     {
    //       daily
    //     }
    //   i++;
    // });
    return _weatherTabs;
    // Map<String, List<Weather>> weatherTabs = {};
    // // List<Weather> weatherTabs= weatherList;
    // _hourlyPresentFutureWeather.forEach((weatherByHour) {
    //   // weatherTabs[weatherByHour.date.difference(DateTime.now()).inDays].add(weatherByHour);
    //   if (weatherTabs
    //       .containsKey(DateFormat('dd mm').format(weatherByHour.date))) {
    //     weatherTabs[weatherTabs
    //         .containsKey(DateFormat('dd mm').format(weatherByHour.date))]
    //         .add(weatherByHour);
    //   } else {
    //     weatherTabs.addAll({
    //       DateFormat('dd mm').format(weatherByHour.date): [weatherByHour]
    //     });
    //   }
    //   print('weatherTabs');
    //   print('${weatherByHour.date}');
    // });
  }
}
