// import 'package:flutter_test/flutter_test.dart';
// import 'package:the_weather_app/core/utils.dart';
// import 'package:timezone/data/latest.dart' as tz;
//
// void main() {
//   test("get History List Weather (map history from API to actual history)", () {
//     tz.initializeTimeZones();
//
//     var hourlyJson1 = [
//           {
//             "dt": 1684195200,
//             "temp": 20.33,
//             "feels_like": 20.72,
//             "pressure": 1008,
//             "humidity": 88,
//             "dew_point": 18.28,
//             "uvi": 0,
//             "clouds": 18,
//             "visibility": 4000,
//             "wind_speed": 4.63,
//             "wind_deg": 50,
//             "weather": [
//               {"id": 701, "main": "Mist", "description": "mist", "icon": "50n"}
//             ]
//           },
//           {
//             "dt": 1684198800,
//             "temp": 20.33,
//             "feels_like": 20.72,
//             "pressure": 1008,
//             "humidity": 88,
//             "dew_point": 18.28,
//             "uvi": 0,
//             "clouds": 29,
//             "visibility": 6000,
//             "wind_speed": 4.12,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03n"
//               }
//             ]
//           },
//           {
//             "dt": 1684202400,
//             "temp": 20.33,
//             "feels_like": 20.72,
//             "pressure": 1008,
//             "humidity": 88,
//             "dew_point": 18.28,
//             "uvi": 0,
//             "clouds": 64,
//             "visibility": 6000,
//             "wind_speed": 3.6,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 803,
//                 "main": "Clouds",
//                 "description": "broken clouds",
//                 "icon": "04n"
//               }
//             ]
//           },
//           {
//             "dt": 1684206000,
//             "temp": 19.33,
//             "feels_like": 19.62,
//             "pressure": 1008,
//             "humidity": 88,
//             "dew_point": 17.29,
//             "uvi": 0,
//             "clouds": 76,
//             "visibility": 6000,
//             "wind_speed": 3.6,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 803,
//                 "main": "Clouds",
//                 "description": "broken clouds",
//                 "icon": "04n"
//               }
//             ]
//           },
//           {
//             "dt": 1684209600,
//             "temp": 19.33,
//             "feels_like": 19.77,
//             "pressure": 1008,
//             "humidity": 94,
//             "dew_point": 18.34,
//             "uvi": 0.23,
//             "clouds": 82,
//             "visibility": 6000,
//             "wind_speed": 4.12,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 803,
//                 "main": "Clouds",
//                 "description": "broken clouds",
//                 "icon": "04d"
//               }
//             ]
//           },
//           {
//             "dt": 1684213200,
//             "temp": 21.33,
//             "feels_like": 21.56,
//             "pressure": 1008,
//             "humidity": 78,
//             "dew_point": 17.34,
//             "uvi": 1.03,
//             "clouds": 86,
//             "visibility": 6000,
//             "wind_speed": 4.63,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 804,
//                 "main": "Clouds",
//                 "description": "overcast clouds",
//                 "icon": "04d"
//               }
//             ]
//           },
//           {
//             "dt": 1684216800,
//             "temp": 22.33,
//             "feels_like": 22.39,
//             "pressure": 1008,
//             "humidity": 68,
//             "dew_point": 16.14,
//             "uvi": 2.62,
//             "clouds": 23,
//             "visibility": 8000,
//             "wind_speed": 4.63,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 801,
//                 "main": "Clouds",
//                 "description": "few clouds",
//                 "icon": "02d"
//               }
//             ]
//           },
//           {
//             "dt": 1684220400,
//             "temp": 25.33,
//             "feels_like": 25.41,
//             "pressure": 1008,
//             "humidity": 57,
//             "dew_point": 16.2,
//             "uvi": 4.84,
//             "clouds": 38,
//             "visibility": 8000,
//             "wind_speed": 4.12,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03d"
//               }
//             ]
//           },
//           {
//             "dt": 1684224000,
//             "temp": 27.33,
//             "feels_like": 27.34,
//             "pressure": 1008,
//             "humidity": 44,
//             "dew_point": 14.02,
//             "uvi": 7.19,
//             "clouds": 23,
//             "visibility": 8000,
//             "wind_speed": 3.6,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 801,
//                 "main": "Clouds",
//                 "description": "few clouds",
//                 "icon": "02d"
//               }
//             ]
//           },
//           {
//             "dt": 1684227600,
//             "temp": 29.33,
//             "feels_like": 28.67,
//             "pressure": 1008,
//             "humidity": 37,
//             "dew_point": 13.14,
//             "uvi": 8.94,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 1.54,
//             "wind_deg": 20,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684231200,
//             "temp": 32.33,
//             "feels_like": 30.85,
//             "pressure": 1008,
//             "humidity": 27,
//             "dew_point": 10.96,
//             "uvi": 9.49,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 2.06,
//             "wind_deg": 340,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684234800,
//             "temp": 33.33,
//             "feels_like": 32.26,
//             "pressure": 1007,
//             "humidity": 29,
//             "dew_point": 12.89,
//             "uvi": 8.72,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 3.09,
//             "wind_deg": 330,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684238400,
//             "temp": 34.33,
//             "feels_like": 32.31,
//             "pressure": 1007,
//             "humidity": 20,
//             "dew_point": 8.16,
//             "uvi": 6.87,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 2.06,
//             "wind_deg": 330,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684242000,
//             "temp": 35.33,
//             "feels_like": 33.18,
//             "pressure": 1006,
//             "humidity": 18,
//             "dew_point": 7.43,
//             "uvi": 3.5,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 1.54,
//             "wind_deg": 280,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684245600,
//             "temp": 35.33,
//             "feels_like": 33.55,
//             "pressure": 1006,
//             "humidity": 21,
//             "dew_point": 9.7,
//             "uvi": 1.81,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 2.06,
//             "wind_deg": 330,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684249200,
//             "temp": 34.33,
//             "feels_like": 32.53,
//             "pressure": 1006,
//             "humidity": 22,
//             "dew_point": 9.57,
//             "uvi": 0.67,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 3.6,
//             "wind_deg": 330,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684252800,
//             "temp": 34.33,
//             "feels_like": 33.06,
//             "pressure": 1006,
//             "humidity": 26,
//             "dew_point": 12.08,
//             "uvi": 0.13,
//             "clouds": 100,
//             "visibility": 6000,
//             "wind_speed": 3.6,
//             "wind_deg": 320,
//             "weather": [
//               {
//                 "id": 804,
//                 "main": "Clouds",
//                 "description": "overcast clouds",
//                 "icon": "04d"
//               }
//             ]
//           },
//           {
//             "dt": 1684256400,
//             "temp": 32.33,
//             "feels_like": 31.89,
//             "pressure": 1007,
//             "humidity": 35,
//             "dew_point": 14.92,
//             "uvi": 0,
//             "clouds": 100,
//             "visibility": 6000,
//             "wind_speed": 4.63,
//             "wind_deg": 360,
//             "weather": [
//               {
//                 "id": 804,
//                 "main": "Clouds",
//                 "description": "overcast clouds",
//                 "icon": "04n"
//               }
//             ]
//           },
//           {
//             "dt": 1684260000,
//             "temp": 30.33,
//             "feels_like": 30.76,
//             "pressure": 1007,
//             "humidity": 45,
//             "dew_point": 17.07,
//             "uvi": 0,
//             "clouds": 95,
//             "visibility": 6000,
//             "wind_speed": 4.12,
//             "wind_deg": 20,
//             "weather": [
//               {
//                 "id": 804,
//                 "main": "Clouds",
//                 "description": "overcast clouds",
//                 "icon": "04n"
//               }
//             ]
//           },
//           {
//             "dt": 1684263600,
//             "temp": 28.33,
//             "feels_like": 28.93,
//             "pressure": 1008,
//             "humidity": 51,
//             "dew_point": 17.23,
//             "uvi": 0,
//             "clouds": 96,
//             "visibility": 6000,
//             "wind_speed": 2.06,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 804,
//                 "main": "Clouds",
//                 "description": "overcast clouds",
//                 "icon": "04n"
//               }
//             ]
//           },
//           {
//             "dt": 1684267200,
//             "temp": 27.33,
//             "feels_like": 28.03,
//             "pressure": 1008,
//             "humidity": 54,
//             "dew_point": 17.21,
//             "uvi": 0,
//             "clouds": 48,
//             "visibility": 6000,
//             "wind_speed": 2.06,
//             "wind_deg": 340,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03n"
//               }
//             ]
//           },
//           {
//             "dt": 1684270800,
//             "temp": 26.33,
//             "feels_like": 26.33,
//             "pressure": 1008,
//             "humidity": 61,
//             "dew_point": 18.21,
//             "uvi": 0,
//             "clouds": 32,
//             "visibility": 6000,
//             "wind_speed": 2.57,
//             "wind_deg": 360,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03n"
//               }
//             ]
//           },
//           {
//             "dt": 1684274400,
//             "temp": 26.33,
//             "feels_like": 26.33,
//             "pressure": 1008,
//             "humidity": 61,
//             "dew_point": 18.21,
//             "uvi": 0,
//             "clouds": 24,
//             "visibility": 6000,
//             "wind_speed": 2.06,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 801,
//                 "main": "Clouds",
//                 "description": "few clouds",
//                 "icon": "02n"
//               }
//             ]
//           },
//           {
//             "dt": 1684278000,
//             "temp": 25.33,
//             "feels_like": 25.62,
//             "pressure": 1007,
//             "humidity": 65,
//             "dew_point": 18.28,
//             "uvi": 0,
//             "clouds": 19,
//             "visibility": 6000,
//             "wind_speed": 2.06,
//             "wind_deg": 30,
//             "weather": [
//               {
//                 "id": 801,
//                 "main": "Clouds",
//                 "description": "few clouds",
//                 "icon": "02n"
//               }
//             ]
//           }
//         ];
//     var historyWeatherModel1 = HistoryWeatherModel.fromJson({
//         "lat": 30.0444,
//         "lon": 31.2357,
//         "timezone": "Africa/Cairo",
//         "timezone_offset": 7200,
//         "current": const {
//           "dt": 1684256944,
//           "sunrise": 1684206083,
//           "sunset": 1684255298,
//           "temp": 32.33,
//           "feels_like": 31.89,
//           "pressure": 1007,
//           "humidity": 35,
//           "dew_point": 14.92,
//           "uvi": 0,
//           "clouds": 100,
//           "visibility": 6000,
//           "wind_speed": 4.63,
//           "wind_deg": 360,
//           "weather": [
//             {
//               "id": 804,
//               "main": "Clouds",
//               "description": "overcast clouds",
//               "icon": "04n"
//             }
//           ]
//         },
//         "hourly": hourlyJson1
//       });
//     var hourlyJson2 = [
//           {
//             "dt": 1684108800,
//             "temp": 19.33,
//             "feels_like": 19.33,
//             "pressure": 1013,
//             "humidity": 77,
//             "dew_point": 15.2,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684112400,
//             "temp": 19.33,
//             "feels_like": 19.46,
//             "pressure": 1013,
//             "humidity": 82,
//             "dew_point": 16.18,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.17,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684116000,
//             "temp": 19.33,
//             "feels_like": 19.33,
//             "pressure": 1013,
//             "humidity": 77,
//             "dew_point": 15.2,
//             "uvi": 0,
//             "clouds": 20,
//             "visibility": 10000,
//             "wind_speed": 6.17,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 801,
//                 "main": "Clouds",
//                 "description": "few clouds",
//                 "icon": "02n"
//               }
//             ]
//           },
//           {
//             "dt": 1684119600,
//             "temp": 19.33,
//             "feels_like": 19.33,
//             "pressure": 1013,
//             "humidity": 77,
//             "dew_point": 15.2,
//             "uvi": 0,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03n"
//               }
//             ]
//           },
//           {
//             "dt": 1684123200,
//             "temp": 18.33,
//             "feels_like": 18.36,
//             "pressure": 1013,
//             "humidity": 82,
//             "dew_point": 15.21,
//             "uvi": 0.23,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03d"
//               }
//             ]
//           },
//           {
//             "dt": 1684126800,
//             "temp": 19.33,
//             "feels_like": 19.46,
//             "pressure": 1013,
//             "humidity": 82,
//             "dew_point": 16.18,
//             "uvi": 1.04,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03d"
//               }
//             ]
//           },
//           {
//             "dt": 1684130400,
//             "temp": 21.33,
//             "feels_like": 21.29,
//             "pressure": 1012,
//             "humidity": 68,
//             "dew_point": 15.19,
//             "uvi": 2.68,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03d"
//               }
//             ]
//           },
//           {
//             "dt": 1684134000,
//             "temp": 23.33,
//             "feels_like": 23.18,
//             "pressure": 1012,
//             "humidity": 56,
//             "dew_point": 14.07,
//             "uvi": 4.96,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684137600,
//             "temp": 25.33,
//             "feels_like": 25.07,
//             "pressure": 1012,
//             "humidity": 44,
//             "dew_point": 12.21,
//             "uvi": 7.38,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684141200,
//             "temp": 27.33,
//             "feels_like": 27.06,
//             "pressure": 1011,
//             "humidity": 39,
//             "dew_point": 12.17,
//             "uvi": 9.18,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684144800,
//             "temp": 29.33,
//             "feels_like": 28.43,
//             "pressure": 1010,
//             "humidity": 34,
//             "dew_point": 11.85,
//             "uvi": 9.76,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684148400,
//             "temp": 31.33,
//             "feels_like": 29.81,
//             "pressure": 1010,
//             "humidity": 27,
//             "dew_point": 10.11,
//             "uvi": 8.97,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684152000,
//             "temp": 32.33,
//             "feels_like": 30.49,
//             "pressure": 1009,
//             "humidity": 23,
//             "dew_point": 8.57,
//             "uvi": 7.07,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684155600,
//             "temp": 31.33,
//             "feels_like": 29.98,
//             "pressure": 1008,
//             "humidity": 29,
//             "dew_point": 11.18,
//             "uvi": 4.72,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.72,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684159200,
//             "temp": 31.33,
//             "feels_like": 30.08,
//             "pressure": 1008,
//             "humidity": 30,
//             "dew_point": 11.69,
//             "uvi": 2.44,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.72,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684162800,
//             "temp": 30.33,
//             "feels_like": 28.92,
//             "pressure": 1008,
//             "humidity": 28,
//             "dew_point": 9.8,
//             "uvi": 0.89,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.72,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684166400,
//             "temp": 29.33,
//             "feels_like": 28.28,
//             "pressure": 1008,
//             "humidity": 32,
//             "dew_point": 10.94,
//             "uvi": 0.18,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.2,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684170000,
//             "temp": 27.33,
//             "feels_like": 26.9,
//             "pressure": 1009,
//             "humidity": 36,
//             "dew_point": 10.96,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.72,
//             "wind_deg": 30,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684173600,
//             "temp": 25.33,
//             "feels_like": 25.15,
//             "pressure": 1009,
//             "humidity": 47,
//             "dew_point": 13.22,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.69,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684177200,
//             "temp": 24.33,
//             "feels_like": 24.31,
//             "pressure": 1010,
//             "humidity": 57,
//             "dew_point": 15.27,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.2,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684180800,
//             "temp": 23.33,
//             "feels_like": 23.29,
//             "pressure": 1010,
//             "humidity": 60,
//             "dew_point": 15.13,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684184400,
//             "temp": 22.33,
//             "feels_like": 22.39,
//             "pressure": 1009,
//             "humidity": 68,
//             "dew_point": 16.14,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684188000,
//             "temp": 21.33,
//             "feels_like": 21.56,
//             "pressure": 1009,
//             "humidity": 78,
//             "dew_point": 17.34,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684191600,
//             "temp": 21.33,
//             "feels_like": 21.56,
//             "pressure": 1009,
//             "humidity": 78,
//             "dew_point": 17.34,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           }
//         ];
//     var historyWeatherModel2 = HistoryWeatherModel.fromJson({
//         "lat": 30.0444,
//         "lon": 31.2357,
//         "timezone": "Africa/Cairo",
//         "timezone_offset": 7200,
//         "current": const {
//           "dt": 1684170544,
//           "sunrise": 1684119719,
//           "sunset": 1684168859,
//           "temp": 27.33,
//           "feels_like": 26.9,
//           "pressure": 1009,
//           "humidity": 36,
//           "dew_point": 10.96,
//           "uvi": 0,
//           "clouds": 0,
//           "visibility": 10000,
//           "wind_speed": 7.72,
//           "wind_deg": 30,
//           "weather": [
//             {
//               "id": 800,
//               "main": "Clear",
//               "description": "clear sky",
//               "icon": "01n"
//             }
//           ]
//         },
//         "hourly": hourlyJson2
//       });
//     var hourlyJson3 = [
//           {
//             "dt": 1684022400,
//             "temp": 18.33,
//             "feels_like": 18.23,
//             "pressure": 1018,
//             "humidity": 77,
//             "dew_point": 14.23,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 3.6,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684026000,
//             "temp": 18.33,
//             "feels_like": 18.1,
//             "pressure": 1018,
//             "humidity": 72,
//             "dew_point": 13.2,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.12,
//             "wind_deg": 30,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684029600,
//             "temp": 18.33,
//             "feels_like": 18.1,
//             "pressure": 1018,
//             "humidity": 72,
//             "dew_point": 13.2,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 3.6,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684033200,
//             "temp": 18.33,
//             "feels_like": 17.99,
//             "pressure": 1017,
//             "humidity": 68,
//             "dew_point": 12.33,
//             "uvi": 0,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 3.6,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03n"
//               }
//             ]
//           },
//           {
//             "dt": 1684036800,
//             "temp": 18.33,
//             "feels_like": 18.1,
//             "pressure": 1018,
//             "humidity": 72,
//             "dew_point": 13.2,
//             "uvi": 0.21,
//             "clouds": 40,
//             "visibility": 10000,
//             "wind_speed": 4.12,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 802,
//                 "main": "Clouds",
//                 "description": "scattered clouds",
//                 "icon": "03d"
//               }
//             ]
//           },
//           {
//             "dt": 1684040400,
//             "temp": 18.33,
//             "feels_like": 18.1,
//             "pressure": 1018,
//             "humidity": 72,
//             "dew_point": 13.2,
//             "uvi": 0.98,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684044000,
//             "temp": 19.33,
//             "feels_like": 18.96,
//             "pressure": 1018,
//             "humidity": 63,
//             "dew_point": 12.12,
//             "uvi": 2.52,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684047600,
//             "temp": 21.33,
//             "feels_like": 20.98,
//             "pressure": 1018,
//             "humidity": 56,
//             "dew_point": 12.2,
//             "uvi": 4.8,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 2.06,
//             "wind_deg": 30,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684051200,
//             "temp": 22.33,
//             "feels_like": 21.9,
//             "pressure": 1017,
//             "humidity": 49,
//             "dew_point": 11.11,
//             "uvi": 7.15,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.12,
//             "wind_deg": 30,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684054800,
//             "temp": 23.33,
//             "feels_like": 22.92,
//             "pressure": 1017,
//             "humidity": 46,
//             "dew_point": 11.07,
//             "uvi": 8.9,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684058400,
//             "temp": 26.33,
//             "feels_like": 26.33,
//             "pressure": 1016,
//             "humidity": 36,
//             "dew_point": 10.08,
//             "uvi": 9.37,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684062000,
//             "temp": 27.33,
//             "feels_like": 26.81,
//             "pressure": 1015,
//             "humidity": 34,
//             "dew_point": 10.1,
//             "uvi": 8.61,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 3.6,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684065600,
//             "temp": 28.33,
//             "feels_like": 27.44,
//             "pressure": 1015,
//             "humidity": 32,
//             "dew_point": 10.07,
//             "uvi": 6.77,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 20,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684069200,
//             "temp": 30.33,
//             "feels_like": 28.92,
//             "pressure": 1014,
//             "humidity": 28,
//             "dew_point": 9.8,
//             "uvi": 4.08,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684072800,
//             "temp": 29.33,
//             "feels_like": 28.28,
//             "pressure": 1014,
//             "humidity": 32,
//             "dew_point": 10.94,
//             "uvi": 2.1,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 20,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684076400,
//             "temp": 29.33,
//             "feels_like": 28.28,
//             "pressure": 1014,
//             "humidity": 32,
//             "dew_point": 10.94,
//             "uvi": 0.77,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 350,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684080000,
//             "temp": 28.33,
//             "feels_like": 27.56,
//             "pressure": 1014,
//             "humidity": 34,
//             "dew_point": 10.98,
//             "uvi": 0.16,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 20,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01d"
//               }
//             ]
//           },
//           {
//             "dt": 1684083600,
//             "temp": 27.33,
//             "feels_like": 27.53,
//             "pressure": 1014,
//             "humidity": 47,
//             "dew_point": 15.04,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 7.2,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684087200,
//             "temp": 24.33,
//             "feels_like": 24.31,
//             "pressure": 1015,
//             "humidity": 57,
//             "dew_point": 15.27,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 8.23,
//             "wind_deg": 10,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684090800,
//             "temp": 23.33,
//             "feels_like": 23.18,
//             "pressure": 1016,
//             "humidity": 56,
//             "dew_point": 14.07,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 4.63,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684094400,
//             "temp": 21.33,
//             "feels_like": 21.19,
//             "pressure": 1016,
//             "humidity": 64,
//             "dew_point": 14.25,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 60,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684098000,
//             "temp": 20.33,
//             "feels_like": 20.32,
//             "pressure": 1015,
//             "humidity": 73,
//             "dew_point": 15.33,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 6.17,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684101600,
//             "temp": 19.33,
//             "feels_like": 19.33,
//             "pressure": 1015,
//             "humidity": 77,
//             "dew_point": 15.2,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.14,
//             "wind_deg": 50,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           },
//           {
//             "dt": 1684105200,
//             "temp": 19.33,
//             "feels_like": 19.33,
//             "pressure": 1014,
//             "humidity": 77,
//             "dew_point": 15.2,
//             "uvi": 0,
//             "clouds": 0,
//             "visibility": 10000,
//             "wind_speed": 5.66,
//             "wind_deg": 40,
//             "weather": [
//               {
//                 "id": 800,
//                 "main": "Clear",
//                 "description": "clear sky",
//                 "icon": "01n"
//               }
//             ]
//           }
//         ];
//     var historyWeatherModel3 = HistoryWeatherModel.fromJson({
//         "lat": 30.0444,
//         "lon": 31.2357,
//         "timezone": "Africa/Cairo",
//         "timezone_offset": 7200,
//         "current": const {
//           "dt": 1684084144,
//           "sunrise": 1684033357,
//           "sunset": 1684082419,
//           "temp": 27.33,
//           "feels_like": 27.53,
//           "pressure": 1014,
//           "humidity": 47,
//           "dew_point": 15.04,
//           "uvi": 0,
//           "clouds": 0,
//           "visibility": 10000,
//           "wind_speed": 7.2,
//           "wind_deg": 10,
//           "weather": [
//             {
//               "id": 800,
//               "main": "Clear",
//               "description": "clear sky",
//               "icon": "01n"
//             }
//           ]
//         },
//         "hourly": hourlyJson3
//       });
//     List<HistoryWeatherModel> resultFromApi = [
//       historyWeatherModel1,
//       historyWeatherModel2,
//       historyWeatherModel3,
//     ];
//
//     final result = mapHistoryUtcToTimezone(resultFromApi,);
//     printDebug("getHistoryListWeather $resultFromApi $result");
//   });
// }
