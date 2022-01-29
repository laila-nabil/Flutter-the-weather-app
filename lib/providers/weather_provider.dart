import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:the_weather_app/models/location.dart' as locationModel;

import '../models/weather.dart';
import '../models/current_weather.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> _pastWeather = [];
  List<Weather> _futureWeather = [];
  String _lat = '30.0444'; //cairo's latitude
  String _lon = '31.2357'; //cairo's longitude
  int timezoneOffset = 7200;

  // String _lat = '37.5665'; //seoul's latitude
  // String _lon = '126.977'; //seoul's longitude
  Weather _todayWeather;
  List<Weather> _hourlyPastWeather = [];
  Map<String,Weather> _hourlyPastWeatherMap = {};
  List<Weather> _hourlyPresentFutureWeather = [];
  CurrentWeather _weatherNow;
  String _compareTodayYesterday = '';
  String location = '';
  var langEn = true;
  static const localTime = false;
  static const int historyDays = 4;
  static const int historyDaysUTC = 5;
  static bool isImage3D = true;
  bool isLoading = false;
  static const terminalApi = String.fromEnvironment("api_key");
  var _API_KEY = kIsWeb ? terminalApi : dotenv.env['API_KEY'];

  DateTime daysFromNow(int daysAgo) {
    var timeNow = DateTime.now();
    var timeNowUtc = timeNow.toUtc();
    var date = !timezoneOffset.sign.isNegative
        ? timeNowUtc
            .subtract(Duration(
              days: daysAgo,
            ))
            .add(Duration(seconds: timezoneOffset.abs()))
        : timeNowUtc
            .subtract(Duration(
              days: daysAgo,
            ))
            .subtract(Duration(seconds: timezoneOffset.abs()));
    return date;
  }

  int dateToUnixSeconds({bool byDay, int duration}) {
    var timeNow = DateTime.now();
    var timeNowUtc = timeNow.toUtc();
    var durationDiff = byDay ? Duration(days: duration,) : Duration(hours: duration,);
    var unixTime = !timezoneOffset.sign.isNegative
        ? ((timeNowUtc
                    .subtract(durationDiff)
                    .add(Duration(seconds: timezoneOffset))
                    .millisecondsSinceEpoch) /
                1000)
            .round()
        : ((timeNowUtc
                    .subtract(durationDiff)
                    .subtract(Duration(seconds: timezoneOffset))
                    .millisecondsSinceEpoch) /
                1000)
            .round();
    return unixTime;
  }

  DateTime unixSecondsToDate(int unixTimeStamp) {
    //If [isUtc] is false then the date is in the local time zone.
    return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  }

  DateTime unixSecondsToDateTimezone(int unixTimeStamp, int timezoneOffset) {
    //If [isUtc] is false then the date is in the local time zone.
    return DateTime.fromMillisecondsSinceEpoch(
        (unixTimeStamp + timezoneOffset) * 1000,
        isUtc: true);
  }

  Future<void> getCurrentWeatherAPI() async {
    // var API_key = DotEnv.env['API_KEY'];
    var API_key = _API_KEY;
    isLoading = true;
    // const lat = '30.0444';
    // const lon = '31.2357';
    // const part = 'minutely,hourly';
    final lang = langEn ? '':'&lang=ar';
    const excludedPart = 'minutely';
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric$lang&appid=$API_key';
    print('CurrentWeather url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      final currentWeather = json.decode(response.body);
      final iconNow = currentWeather['weather'][0]['icon'];
      _weatherNow = CurrentWeather(
        lat: lat,
        lon: lon,
        isImageNetwork: !isImage3D,
        image: isImage3D
            ? 'assets/3d/$iconNow.png'
            : 'https://openweathermap.org/img/wn/$iconNow@4x.png',
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
    final lang = langEn ? '':'&lang=ar';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=$excludedPart&units=metric$lang&appid=${API_key}';
    print('PresentFuture url is $url');
    try {
      _hourlyPresentFutureWeather = [];
      final response = await http.get(Uri.parse(url));
      final presentFutureWeather = json.decode(response.body);
      timezoneOffset = presentFutureWeather['timezone_offset'];
      final date = presentFutureWeather['daily'][0]['dt'] as int;
      final iconNow = presentFutureWeather['current']['weather'][0]['icon'];
      final icon = presentFutureWeather['daily'][0]['weather'][0]['icon'];
      final List hourly = presentFutureWeather['hourly'];
      print('***hourly _hourlyPresentFutureWeather');
      hourly.forEach((element) {
        // print('=>for element');
        // print(element['weather'][0]['main']);
        // print("day unixSecondsToDateTimezone: ${unixSecondsToDateTimezone(element['dt'],presentFutureWeather['timezone_offset'])}");
        _hourlyPresentFutureWeather.add(Weather(
            lat: lat,
            lon: lon,
            isImageNetwork: !isImage3D,
            image: isImage3D
                ? 'assets/3d/${element['weather'][0]['icon']}.png'
                : 'https://openweathermap.org/img/wn/${element['weather'][0]['icon']}@4x.png',
            mainDescription: element['weather'][0]['main'],
            detailedDescription: element['weather'][0]['description'],
            // date: unixSecondsToDate(element['dt']),
            // date: unixSecondsToDateTimezone(element['dt'],presentFutureWeather['timezone_offset']),
            dt: element['dt'].toString(),
            date: localTime
                ? unixSecondsToDate(element['dt'])
                : unixSecondsToDateTimezone(
                    element['dt'], presentFutureWeather['timezone_offset']),
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
        int compare = localTime
            ? DateFormat('MMM d yyyy')
                .format(DateTime.now())
                .compareTo(DateFormat('MMM d yyyy').format(element.date))
            : DateFormat('MMM d yyyy').format(DateTime.now().toUtc()).compareTo(
                DateFormat('MMM d yyyy').format(element.date.toUtc()));

        if (compare == 0) {
          return true;
        }
        return false;
      });
      print("todayHourly ${todayHourly.length} ${todayHourly}");
      _todayWeather = Weather(
        // date: unixSecondsToDate(date),
        // date: unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']),
        dt: date.toString(),
        date: localTime
            ? unixSecondsToDate(date)
            : unixSecondsToDateTimezone(
                date, presentFutureWeather['timezone_offset']),
        tempMax: presentFutureWeather['daily'][0]['temp']['max'].toString(),
        tempMin: presentFutureWeather['daily'][0]['temp']['min'].toString(),
        lat: lat,
        lon: lon,
        mainDescription: presentFutureWeather['daily'][0]['weather'][0]['main'],
        detailedDescription: presentFutureWeather['daily'][0]['weather'][0]
            ['description'],
        isImageNetwork: !isImage3D,
        image: isImage3D
            ? 'assets/3d/$icon.png'
            : 'https://openweathermap.org/img/wn/$icon@4x.png',
        // weatherTimeline: _hourlyPresentFutureWeather
        //     .where((element) => localTime
        //         ? DateFormat('yyyy-MM-dd')
        //             .format(DateTime.now())
        //             .compareTo(DateFormat('yyyy-MM-dd').format(element.date))
        //         : DateFormat('yyyy-MM-dd')
        //                 .format(DateTime.now().toUtc())
        //                 .compareTo(DateFormat('yyyy-MM-dd')
        //                     .format(element.date.toUtc())) ==
        //             0)
        //     .toList(),
        weatherTimeline: _hourlyPresentFutureWeather.where((element) {
          // print("weather Timeline ${element.date} $date ${unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset'])}");
          // print("weather Timeline ${DateFormat('yyyy-MM-dd')
          //     .format(element.date)
          //     .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']))) }");
          return localTime
              ? DateFormat('yyyy-MM-dd').format(element.date).compareTo(
                  DateFormat('yyyy-MM-dd').format(unixSecondsToDate(date)))
              : DateFormat('yyyy-MM-dd').format(element.date).compareTo(
                      DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(
                          date, presentFutureWeather['timezone_offset']))) ==
                  0;
        }).toList(),
      );
      await getLocationFromCoordinates();
      _futureWeather = [];
      for (int i = 1; i < 6; i++) {
        final date = presentFutureWeather['daily'][i]['dt'] as int;
        final icon = presentFutureWeather['daily'][i]['weather'][0]['icon'];
        _futureWeather.add(Weather(
          // date: unixSecondsToDate(date),
          // date: unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']),
          dt: date.toString(),
          date: localTime
              ? unixSecondsToDate(date)
              : unixSecondsToDateTimezone(
                  date, presentFutureWeather['timezone_offset']),
          tempMax: presentFutureWeather['daily'][i]['temp']['max'].toString(),
          tempMin: presentFutureWeather['daily'][i]['temp']['min'].toString(),
          lat: lat,
          lon: lon,
          mainDescription: presentFutureWeather['daily'][i]['weather'][0]
              ['main'],
          detailedDescription: presentFutureWeather['daily'][i]['weather'][0]
              ['description'],
          isImageNetwork: !isImage3D,
          image: isImage3D
              ? 'assets/3d/$icon.png'
              : 'https://openweathermap.org/img/wn/$icon@4x.png',
          weatherTimeline: _hourlyPresentFutureWeather.where((element) {
            // print("weather Timeline ${element.date} $date ${unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset'])}");
            // print("weather Timeline ${DateFormat('yyyy-MM-dd')
            //     .format(element.date)
            //     .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']))) }");
            return localTime
                ? DateFormat('yyyy-MM-dd').format(element.date).compareTo(
                    DateFormat('yyyy-MM-dd').format(unixSecondsToDate(date)))
                : DateFormat('yyyy-MM-dd').format(element.date).compareTo(
                        DateFormat('yyyy-MM-dd').format(
                            unixSecondsToDateTimezone(date,
                                presentFutureWeather['timezone_offset']))) ==
                    0;
          }).toList(),
        ));
      }
      print('present done');
    } catch (error) {
      throw (error);
    }
    isLoading = false;
  }

  Future<void> getHistoryDataAPIUTC({bool byDay, int duration}) async {
    // var API_key = DotEnv.env['API_KEY'];
    // var API_key = dotenv.env['API_KEY'];
    var API_key = _API_KEY;
    const part = 'current,minutely';

    var unixTimestamp = dateToUnixSeconds(byDay: byDay,duration: duration);
    print('nightTime $unixTimestamp');
    final lang = langEn ? '':'&lang=ar';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=$lat&lon=$lon&dt=$unixTimestamp&exclude=$part&units=metric$lang&appid=${API_key}';
    print('history url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      print('daysAgo $duration');
      final historyWeather = json.decode(response.body);
      List<dynamic> hourlyPast = json.decode(response.body)['hourly'];
      hourlyPast.forEach((element) {
        _hourlyPastWeatherMap[element['dt'].toString()]=Weather(
            lat: lat,
            lon: lon,
            isImageNetwork: !isImage3D,
            image: isImage3D
                ? 'assets/3d/${element['weather'][0]['icon']}.png'
                : 'https://openweathermap.org/img/wn/${element['weather'][0]['icon']}@4x.png',
            mainDescription: element['weather'][0]['main'].toString(),
            detailedDescription:
            element['weather'][0]['description'].toString(),
            humidity: element['humidity'].toString(),
            feelsLike: element['feels_like'].toString(),
            uvi: element['uvi'].toString(),
            clouds: element['clouds'].toString(),
            windDeg: element['wind_deg'].toString(),
            windSpeed: element['wind_speed'].toString(),
            pressure: element['pressure'].toString(),
            visibility: element['visibility'].toString(),
            // date: unixSecondsToDate(element['dt']),
            // date:unixSecondsToDateTimezone(element['dt'],historyWeather['timezone_offset']),
            dt: element['dt'].toString(),
            date: localTime
                ? unixSecondsToDate(element['dt'])
                : unixSecondsToDateTimezone(
                element['dt'], historyWeather['timezone_offset']),
            rain: "0.0",
            tempCurrent: element['temp'].toString());
      });
    } catch (error) {
      print('error getHistoryDataAPIUTC daysAgo $duration $error');
      throw (error);
    }
  }

  Future<void> getAllHistoryWeatherUTC() async {
    print('getAllHistoryWeather');
    isLoading = true;
    try {
      _pastWeather = [];
      _hourlyPastWeather = [];
      print('reset _pastWeather _hourlyPastWeather');
      await getHistoryDataAPIUTC(duration: 15,byDay: false);
      for (int i = 1; i <= historyDaysUTC; i++) {
      // for (int i = historyDaysUTC; i >= 1; i--) {
        print('i before $i');
        await getHistoryDataAPIUTC(duration: i,byDay: true);
        print('i after $i');
      }
      for (int j = 1; j <= historyDays; j++) {
        List<Weather> weatherTimeline = [];
        List<Weather> weatherTimelineSorted = [];
        List<Weather> weatherTimelineNoDup = [];
        weatherTimeline = _hourlyPastWeatherMap.values.where((element) =>
        DateFormat('yyyy-MM-dd')
            .format(element.date)
            .compareTo(DateFormat('yyyy-MM-dd').format(daysFromNow(j))) ==
            0).toList()..sort(Weather().sortByDate);
        final weatherTimelineSet = Set<Weather>();
        weatherTimeline.forEach((element) {
          print('element.date.hour ${element.date.hour}');
          weatherTimelineNoDup.insert(element.date.hour, element);
        });
        print('original weatherTimeline ${weatherTimeline.length}');
        print('no dup weatherTimeline ${weatherTimelineNoDup.length}');
        weatherTimelineSorted = weatherTimeline;
        weatherTimelineSorted.sort((a, b) =>
            double.parse(b.tempCurrent).round() -
            double.parse(a.tempCurrent).round());
        var theWeather = Weather(
          date: daysFromNow(j),
          lat: lat,
          lon: lon,
          isMetric: true,
          isImageNetwork: false,
          // weatherTimeline: _hourlyPastWeather.where((element) =>
          //     DateFormat('yyyy-MM-dd')
          //         .format(element.date)
          //         .compareTo(DateFormat('yyyy-MM-dd').format(daysFromNow(j))) ==
          //     0).toList()..sort(Weather().sortByDate),
          weatherTimeline: _hourlyPastWeatherMap.values.where((element) =>
          DateFormat('yyyy-MM-dd')
              .format(element.date)
              .compareTo(DateFormat('yyyy-MM-dd').format(daysFromNow(j))) ==
              0).toList()..sort(Weather().sortByDate),
          tempMax: weatherTimelineSorted.first.tempCurrent,
          tempMin: weatherTimelineSorted.last.tempCurrent,
        );
        _pastWeather.add(theWeather);
        print('_pastWeather.last.weatherTimeline here');
        _pastWeather.last.weatherTimeline.forEach((element) {
          print(element.date);
        });
      }
      final pastWeatherData = _pastWeather;
      _pastWeather = [...(_pastWeather.reversed)];
      final diffDay = double.parse(todayWeather.tempMax) >
              double.parse(pastWeatherData[0].tempMax)
          ? "warmer".tr().toString()
          : "colder".tr().toString();
      final diffNight = double.parse(todayWeather.tempMin) >
              double.parse(pastWeatherData[0].tempMin)
          ? "warmer".tr().toString()
          : "colder".tr().toString();
      final diffMax = double.parse(todayWeather.tempMax) -
          double.parse(pastWeatherData[0].tempMax);
      final diffMin = double.parse(todayWeather.tempMin) -
          double.parse(pastWeatherData[0].tempMin);
      _compareTodayYesterday =
          langEn ? 'Today is $diffDay than yesterday by ${diffMax.toStringAsFixed(2)} °'+'deg'.tr().toString()+' at day and is $diffNight by ${diffMin.toStringAsFixed(2)} °'+'deg'.tr().toString()+' at night' :

           'اليوم $diffDay من الأمس ب${diffMax.toStringAsFixed(2)} °'+'deg'.tr().toString()+' في النهار و$diffNight ب${diffMin.toStringAsFixed(2)} °'+'deg'.tr().toString()+' في الليل' ;
          // 'في الليل'+'deg'.tr().toString()+'°'+'${diffMin.toStringAsFixed(2)}'+'و بمقدار'+'في النهار'+'deg'.tr().toString()+'°'+'${diffMax.toStringAsFixed(2)}'+'من الأمس بمقدار'+'$diffDay'+'اليوم';
      notifyListeners();

      print('got getAllHistoryWeather');
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
    var unixTimestamp = dateToUnixSeconds(duration: daysAgo, byDay:true);
    print('nightTime $unixTimestamp');
    final lang = langEn ? '':'&lang=ar';
    var url =
        'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=$lat&lon=$lon&dt=$unixTimestamp&exclude=$part&units=metric$lang&appid=${API_key}';
    print('history url is $url');
    try {
      final response = await http.get(Uri.parse(url));
      print('daysAgo $daysAgo');
      final historyWeather = json.decode(response.body);
      // print('historyWeather $historyWeather');
      List<dynamic> hourlyPast = json.decode(response.body)['hourly'];
      // print(
      //     'json.decode(response.body)[hourly] ${json.decode(response.body)['hourly'].runtimeType}');
      // print('***hourly history');
      hourlyPast.forEach((element) {
        // print('for element');
        // print(element['weather'][0]['main']);
        // print(unixSecondsToDateTimezone(element['dt'],historyWeather['timezone_offset']));
        _hourlyPastWeather.add(Weather(
            lat: lat,
            lon: lon,
            isImageNetwork: !isImage3D,
            image: isImage3D
                ? 'assets/3d/${element['weather'][0]['icon']}.png'
                : 'https://openweathermap.org/img/wn/${element['weather'][0]['icon']}@4x.png',
            mainDescription: element['weather'][0]['main'].toString(),
            detailedDescription:
                element['weather'][0]['description'].toString(),
            humidity: element['humidity'].toString(),
            feelsLike: element['feels_like'].toString(),
            uvi: element['uvi'].toString(),
            clouds: element['clouds'].toString(),
            windDeg: element['wind_deg'].toString(),
            windSpeed: element['wind_speed'].toString(),
            pressure: element['pressure'].toString(),
            visibility: element['visibility'].toString(),
            // date: unixSecondsToDate(element['dt']),
            // date:unixSecondsToDateTimezone(element['dt'],historyWeather['timezone_offset']),
            dt: element['dt'].toString(),
            date: localTime
                ? unixSecondsToDate(element['dt'])
                : unixSecondsToDateTimezone(
                    element['dt'], historyWeather['timezone_offset']),
            rain: "0.0",
            tempCurrent: element['temp'].toString()));
      });
      List<double> hourlyPastTemp = [];
      List<double> hourlyPastTempSorted = [];
      hourlyPast.forEach((value) {
        {
          // print('adding > $value ${value.runtimeType}');
          double valueDouble = value['temp'] + 0.0;
          // print('value[temp] ${value['temp']} ${value['temp'].runtimeType}');
          hourlyPastTemp.add(valueDouble);
        }
      });
      hourlyPastTempSorted = hourlyPastTemp;
      hourlyPastTempSorted.sort();
      // print(
      //     'at $unixTimestamp : min temp ${hourlyPastTempSorted[0]}, max temp ${hourlyPastTempSorted[hourlyPastTempSorted.length - 1]}');
      print(
          '_pastWeather.insert before for daysAgo $daysAgo and _pastWeather $_pastWeather');
      // _pastWeather.insert(
      //     daysAgo - 1,
      _pastWeather.add(Weather(
        date: DateTime.now().subtract(Duration(days: daysAgo)),
        // date: DateTime.now().toUtc().subtract(Duration(days: daysAgo)),
        lat: lat,
        lon: lon,
        isMetric: true,
        isImageNetwork: false,
        tempMin: hourlyPastTempSorted[0].toString(),
        tempMax:
            hourlyPastTempSorted[hourlyPastTempSorted.length - 1].toString(),
        weatherTimeline: _hourlyPastWeather.where((element) {
          // print("weather Timeline past ${element.date} is ${daysAgo} days ago ? ${DateFormat('yyyy-MM-dd')
          //     .format(element.date)
          //     .compareTo(DateFormat('yyyy-MM-dd').format( DateTime.now().toUtc().subtract(Duration(days: daysAgo))))==0}");
          //     .compareTo(DateFormat('yyyy-MM-dd').format( DateTime.now().toUtc().subtract(Duration(days: daysAgo))))==0}");
          return (DateFormat('yyyy-MM-dd').format(element.date).compareTo(
                  DateFormat('yyyy-MM-dd').format(
                      DateTime.now().subtract(Duration(days: daysAgo)))) ==
              0);
        }).toList(),
      ));
      print('_pastWeather.insert after');
    } catch (error) {
      print('error getHistoryWeatherAPI daysAgo $daysAgo $error');
      throw (error);
    }
  }

  Future<bool> getWeather() async {
    bool result = false;
    print('getWeather()');
    try {
      print('in getWeather()');
      await getCurrentWeatherAPI();
      await getPresentFutureWeatherAPI();
      // await getAllHistoryWeather();
      await getAllHistoryWeatherUTC();
      print('got weather');
      result = true;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
    return result;
  }

  Future<void> getAllHistoryWeather() async {
    print('getAllHistoryWeather');
    isLoading = true;
    try {
      _pastWeather = [];
      _hourlyPastWeather = [];
      print('reset _pastWeather _hourlyPastWeather');
      // for (int i = 1; i <= historyDays; i++) {
      //   print('i before $i');
      //   await getHistoryWeatherAPI(i);
      //   print('i after $i');
      // }
      for (int i = historyDays; i >= 1; i--) {
        print('i before $i');
        await getHistoryWeatherAPI(i);
        print('i after $i');
      }
      final pastWeatherData = _pastWeather;
      // _pastWeather = [...(_pastWeather.reversed)];
      final diffDay = double.parse(todayWeather.tempMax) >
              double.parse(pastWeatherData[0].tempMax)
          ? "warmer"
          : "colder";
      final diffNight = double.parse(todayWeather.tempMin) >
              double.parse(pastWeatherData[0].tempMin)
          ? "warmer"
          : "colder";
      final diffMax = double.parse(todayWeather.tempMax) -
          double.parse(pastWeatherData[0].tempMax);
      final diffMin = double.parse(todayWeather.tempMin) -
          double.parse(pastWeatherData[0].tempMin);
      _compareTodayYesterday =
          'Today is $diffDay than yesterday by ${diffMax.toStringAsFixed(2)}°'+'deg'.tr().toString()+' at day and is $diffNight by ${diffMin.toStringAsFixed(2)}°'+'deg'.tr().toString()+' at night';
      notifyListeners();

      print('got getAllHistoryWeather');
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

  Future<void> setLocationLatLon(
      {@required bool byCurrentLocation, String selectedLat,String selectedLon}) async {
    Position result;
    try {
      print('setLocationLatLon');
      if(byCurrentLocation){
        result = await _determinePosition();
        _lat = result.latitude.toString();
        _lon = result.longitude.toString();
      }else{
        _lat = selectedLat;
        _lon = selectedLon;
      }

      print("location : getting location $_lat $_lon");
      await getLocationFromCoordinates();
      await getCurrentWeatherAPI();
      await getPresentFutureWeatherAPI();
      await getAllHistoryWeather();
      notifyListeners();
    } catch (error) {
      print('location : error $error');
      notifyListeners();
      return Future.error(error);
    }
  }

  String get lat {
    return _lat;
  }

  String get lon {
    return _lon;
  }

  Future<List<Map<String,String>>> autoCompleteSearchLocation(String input) async{
    List<Map<String,String>> result = [];
    var url =
        'https://api.geoapify.com/v1/geocode/autocomplete?text=$input&limit=20&apiKey=2c66c649cf9042658a69266136c59284';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    print('autoCompleteSearchLocation $body');
    final List listResults = body['features'];
    listResults.forEach((element) {
      // result.add({'${element['properties']['city']}, ${element['properties']['country']}' : });
      final city = element['properties']['city']!=null ? '${element['properties']['city']} ,':'';
      final country = element['properties']['country']!=null ? '${element['properties']['country']}':'';
      result.add({'city': city,'country': country,'lat': '${element['properties']['lat']}','lon': '${element['properties']['lon']}'},);
    });
    return result;
  }

  Future<Map> getLocationFromCoordinates() async {
    var url =
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${_todayWeather.lat}&longitude=${_todayWeather.lon}&localityLanguage=${'locale'.tr().toString()}';
    final response = await http.get(Uri.parse(url));

    final locationDetails = json.decode(response.body);
    print('locationDetails $locationDetails');
    if (locationDetails != null) {
      location = locationDetails['city'].toString().isNotEmpty
          ? '${locationDetails['city']},${locationDetails['countryCode']}'
          : '${locationDetails['principalSubdivision']},${locationDetails['countryCode']}';
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
  void toggleLanguage(){
    langEn = !langEn;
    notifyListeners();
  }

  void setLanguageEn(bool isEnglish){
    langEn = isEnglish;
    notifyListeners();
  }
}
