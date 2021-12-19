import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> _pastWeather = [];
  List<Weather> _futureWeather = [];
  Weather _todayWeather;
  String _compareTodayYesterday = '';
  var _API_KEY =  kIsWeb ? String.fromEnvironment("api_key") : dotenv.env['API_KEY'];

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

  Future<void> getPresentFutureWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    // print('before reading api');
    // var API_key_ = dotenv.env['API_KEY'];
    // print('can get api key? $API_key_');
    // var API_key = _API_KEY;
    var API_key = _API_KEY;
    const lat = '30.0444';
    const lon = '31.2357';
    // const part = 'minutely,hourly';
    const part = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=$part&units=metric&appid=${API_key}';
    print('PresentFuture url is $url');
    try{
      final response = await http.get(Uri.parse(url));
      final presentFutureWeather = json.decode(response.body);
      // print("_todayWeather time ${unixSecondsToDate(int.parse(presentFutureWeather['daily'][0]['dt']))}");
      print("_todayWeather time ${presentFutureWeather['daily'][0]['dt']}");
      final date = presentFutureWeather['daily'][0]['dt'] as int;
      print("_todayWeather time $date");
      print("_todayWeather time ${unixSecondsToDate(date)}");
      _todayWeather = Weather(
        date: unixSecondsToDate(date),
        // date: DateTime.now(),
        tempMax: presentFutureWeather['daily'][0]['temp']['max'].toString(),
        tempMin: presentFutureWeather['daily'][0]['temp']['min'].toString(),
        lat: lat,
        lon: lon,
        mainDescription: presentFutureWeather['daily'][0]['weather'][0]['main'],
        detailedDescription: presentFutureWeather['daily'][0]['weather'][0]
        ['description'],
      );
      print('1 _futureWeather lenght ${_futureWeather.length}');
      _futureWeather = [];
      print('2 _futureWeather lenght ${_futureWeather.length}');
      for (int i = 1; i < 6; i++) {
        final date = presentFutureWeather['daily'][i]['dt'] as int;
        _futureWeather.add(Weather(
          date: unixSecondsToDate(date),
          tempMax: presentFutureWeather['daily'][i]['temp']['max'].toString(),
          tempMin: presentFutureWeather['daily'][i]['temp']['min'].toString(),
          lat: lat,
          lon: lon,
          mainDescription: presentFutureWeather['daily'][i]['weather'][0]['main'],
          detailedDescription: presentFutureWeather['daily'][i]['weather'][0]
          ['description'],
          isImageNetwork: true,
          image: presentFutureWeather['daily'][i]['weather'][0]['icon']
        ));
      }
    }catch(error){
      throw(error);
    }
  }

  Future<void> getHistoryWeatherAPI(int daysAgo) async {
    // var API_key = DotEnv.env['API_KEY'];
    // var API_key = dotenv.env['API_KEY'];
    var API_key = _API_KEY;
    const lat = '30.0444';
    const lon = '31.2357';
    const part = 'minutely,hourly';
    var unixTimestamp = dateToUnixSeconds(daysAgo, 0);
    print('nightTime $unixTimestamp');
    var url =
        'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=$lat&lon=$lon&dt=$unixTimestamp&exclude=$part&units=metric&appid=${API_key}';

    print('history url is $url');
    try{
      final response = await http.get(Uri.parse(url));
      print('daysAgo $daysAgo');
      print('getHistoryWeather ${json.decode(response.body)}');
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

      _pastWeather.insert(
          daysAgo - 1,
          Weather(
            date: DateTime.now().subtract(Duration(days: daysAgo)),
            lat: lat,
            lon: lon,
            isMetric: true,
            tempMin: hourlyPastTempSorted[0].toString(),
            tempMax:
            hourlyPastTempSorted[hourlyPastTempSorted.length - 1].toString(),

          ));
      print('end of api call $daysAgo');
    }catch(error){
      throw(error);
    }
  }

  Future<void> getWeather() async {
    print('getting weather');
    try{
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
      _compareTodayYesterday = isHotterToday
          ? 'Today is warmer than yesterday'
          : 'Today is colder than yesterday';
      notifyListeners();
      print('got weather');
    }catch(error)
    {
      throw(error);
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

  List<Weather> get futureWeather {
    print('futureWeather length is ${_futureWeather.length}');
    return [..._futureWeather];
  }

  List<Weather> get pastWeather {
    print('pastWeather length is ${_pastWeather.length}');
    return [..._pastWeather.reversed];
  }
}
