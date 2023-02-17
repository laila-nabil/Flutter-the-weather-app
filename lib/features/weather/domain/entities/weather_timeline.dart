import 'package:equatable/equatable.dart';

import '../../data/models/day_weather_model.dart';
import 'day_weather.dart';

/// queryCost : 1
/// latitude : 30.0443
/// longitude : 31.2353
/// resolvedAddress : "القاهرة, مصر"
/// address : "cairo"
/// timezone : "Africa/Cairo"
/// tzoffset : 2.0
/// days : [{"datetime":"2023-02-17","datetimeEpoch":1676584800,"tempmax":18.0,"tempmin":9.0,"temp":13.8,"feelslikemax":18.0,"feelslikemin":8.5,"feelslike":13.8,"dew":6.6,"humidity":63.8,"precip":0.0,"precipprob":0.0,"precipcover":0.0,"preciptype":null,"snow":0.0,"snowdepth":0.0,"windgust":37.4,"windspeed":29.5,"winddir":31.6,"pressure":1026.9,"cloudcover":40.8,"visibility":8.6,"solarradiation":205.2,"solarenergy":17.7,"uvindex":7.0,"severerisk":10.0,"sunrise":"06:33:36","sunriseEpoch":1676608416,"sunset":"17:45:01","sunsetEpoch":1676648701,"moonphase":0.9,"conditions":"Partially cloudy","description":"Partly cloudy throughout the day.","icon":"partly-cloudy-day","stations":["HECA"],"source":"comb","hours":[{"datetime":"00:00:00","datetimeEpoch":1676584800,"temp":13.0,"feelslike":13.0,"humidity":66.92,"dew":7.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.1,"windspeed":5.4,"winddir":60.0,"pressure":1027.0,"visibility":6.0,"cloudcover":46.9,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"01:00:00","datetimeEpoch":1676588400,"temp":12.0,"feelslike":12.0,"humidity":71.46,"dew":7.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.1,"windspeed":0.0,"winddir":0.0,"pressure":1027.0,"visibility":6.0,"cloudcover":0.4,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":["HECA"],"source":"obs"},{"datetime":"02:00:00","datetimeEpoch":1676592000,"temp":12.0,"feelslike":12.0,"humidity":76.51,"dew":8.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":14.4,"windspeed":7.6,"winddir":350.0,"pressure":1027.0,"visibility":4.0,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":["HECA"],"source":"obs"},{"datetime":"03:00:00","datetimeEpoch":1676595600,"temp":11.0,"feelslike":11.0,"humidity":81.74,"dew":8.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":13.7,"windspeed":5.4,"winddir":10.0,"pressure":1026.0,"visibility":4.0,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":["HECA"],"source":"obs"},{"datetime":"04:00:00","datetimeEpoch":1676599200,"temp":11.0,"feelslike":11.0,"humidity":81.74,"dew":8.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":13.3,"windspeed":5.4,"winddir":20.0,"pressure":1026.0,"visibility":2.0,"cloudcover":21.6,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"05:00:00","datetimeEpoch":1676602800,"temp":10.0,"feelslike":9.6,"humidity":81.61,"dew":7.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":12.6,"windspeed":5.4,"winddir":40.0,"pressure":1026.0,"visibility":2.0,"cloudcover":33.5,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"06:00:00","datetimeEpoch":1676606400,"temp":9.0,"feelslike":8.5,"humidity":87.28,"dew":7.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":12.2,"windspeed":5.4,"winddir":150.0,"pressure":1026.0,"visibility":2.0,"cloudcover":38.3,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"07:00:00","datetimeEpoch":1676610000,"temp":10.0,"feelslike":10.0,"humidity":81.61,"dew":7.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":11.9,"windspeed":0.0,"winddir":0.0,"pressure":1027.0,"visibility":4.0,"cloudcover":42.3,"solarradiation":6.0,"solarenergy":0.0,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"08:00:00","datetimeEpoch":1676613600,"temp":11.0,"feelslike":11.0,"humidity":81.74,"dew":8.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":14.0,"windspeed":0.0,"winddir":0.0,"pressure":1028.0,"visibility":4.0,"cloudcover":7.2,"solarradiation":119.0,"solarenergy":0.4,"uvindex":1.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":["HECA"],"source":"obs"},{"datetime":"09:00:00","datetimeEpoch":1676617200,"temp":12.0,"feelslike":12.0,"humidity":81.87,"dew":9.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":23.4,"windspeed":5.4,"winddir":60.0,"pressure":1028.0,"visibility":6.0,"cloudcover":0.0,"solarradiation":321.0,"solarenergy":1.2,"uvindex":3.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":["HECA"],"source":"obs"},{"datetime":"10:00:00","datetimeEpoch":1676620800,"temp":14.0,"feelslike":14.0,"humidity":71.84,"dew":9.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":26.3,"windspeed":7.6,"winddir":50.0,"pressure":1028.0,"visibility":6.0,"cloudcover":8.8,"solarradiation":510.0,"solarenergy":1.8,"uvindex":5.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":["HECA"],"source":"obs"},{"datetime":"11:00:00","datetimeEpoch":1676624400,"temp":16.0,"feelslike":16.0,"humidity":59.03,"dew":8.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":34.6,"windspeed":20.5,"winddir":40.0,"pressure":1028.0,"visibility":6.0,"cloudcover":88.0,"solarradiation":654.0,"solarenergy":2.4,"uvindex":7.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"12:00:00","datetimeEpoch":1676628000,"temp":17.0,"feelslike":17.0,"humidity":48.29,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":37.4,"windspeed":29.5,"winddir":40.0,"pressure":1027.0,"visibility":6.0,"cloudcover":88.0,"solarradiation":736.0,"solarenergy":2.6,"uvindex":7.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"13:00:00","datetimeEpoch":1676631600,"temp":18.0,"feelslike":18.0,"humidity":45.34,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":37.4,"windspeed":18.4,"winddir":10.0,"pressure":1026.0,"visibility":6.0,"cloudcover":88.0,"solarradiation":748.0,"solarenergy":2.7,"uvindex":7.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"14:00:00","datetimeEpoch":1676635200,"temp":18.0,"feelslike":18.0,"humidity":39.44,"dew":4.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":36.7,"windspeed":13.7,"winddir":39.1,"pressure":1026.0,"visibility":10.0,"cloudcover":88.0,"solarradiation":686.0,"solarenergy":2.5,"uvindex":7.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"15:00:00","datetimeEpoch":1676638800,"temp":18.0,"feelslike":18.0,"humidity":39.44,"dew":4.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":35.6,"windspeed":27.7,"winddir":30.0,"pressure":1025.0,"visibility":10.0,"cloudcover":88.0,"solarradiation":560.0,"solarenergy":2.0,"uvindex":6.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"16:00:00","datetimeEpoch":1676642400,"temp":18.0,"feelslike":18.0,"humidity":42.3,"dew":5.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":34.6,"windspeed":27.7,"winddir":30.0,"pressure":1026.0,"visibility":10.0,"cloudcover":88.0,"solarradiation":382.0,"solarenergy":1.4,"uvindex":4.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"17:00:00","datetimeEpoch":1676646000,"temp":17.0,"feelslike":17.0,"humidity":48.29,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.8,"windspeed":12.6,"winddir":35.4,"pressure":1026.0,"visibility":10.0,"cloudcover":88.0,"solarradiation":179.0,"solarenergy":0.6,"uvindex":2.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":["HECA"],"source":"obs"},{"datetime":"18:00:00","datetimeEpoch":1676649600,"temp":16.0,"feelslike":16.0,"humidity":51.47,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":31.3,"windspeed":24.1,"winddir":20.0,"pressure":1027.0,"visibility":10.0,"cloudcover":88.0,"solarradiation":23.0,"solarenergy":0.1,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"19:00:00","datetimeEpoch":1676653200,"temp":15.0,"feelslike":15.0,"humidity":54.87,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":27.0,"windspeed":25.9,"winddir":30.0,"pressure":1027.0,"visibility":10.0,"cloudcover":50.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"20:00:00","datetimeEpoch":1676656800,"temp":15.0,"feelslike":15.0,"humidity":54.87,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":28.1,"windspeed":11.2,"winddir":37.3,"pressure":1028.0,"visibility":10.0,"cloudcover":25.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs"},{"datetime":"21:00:00","datetimeEpoch":1676660400,"temp":14.0,"feelslike":14.0,"humidity":57.73,"dew":5.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":26.6,"windspeed":10.8,"winddir":35.2,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"22:00:00","datetimeEpoch":1676664000,"temp":12.9,"feelslike":12.9,"humidity":61.17,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":25.2,"windspeed":8.6,"winddir":24.0,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"23:00:00","datetimeEpoch":1676667600,"temp":12.0,"feelslike":12.0,"humidity":63.99,"dew":5.4,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":20.5,"windspeed":7.9,"winddir":18.2,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"}]},{"datetime":"2023-02-18","datetimeEpoch":1676671200,"tempmax":20.3,"tempmin":7.8,"temp":13.9,"feelslikemax":20.3,"feelslikemin":7.0,"feelslike":13.7,"dew":5.2,"humidity":59.1,"precip":0.0,"precipprob":0.0,"precipcover":0.0,"preciptype":null,"snow":0.0,"snowdepth":0.0,"windgust":39.6,"windspeed":15.1,"winddir":25.8,"pressure":1026.7,"cloudcover":10.8,"visibility":24.1,"solarradiation":210.1,"solarenergy":18.2,"uvindex":8.0,"severerisk":10.0,"sunrise":"06:32:41","sunriseEpoch":1676694761,"sunset":"17:45:48","sunsetEpoch":1676735148,"moonphase":0.94,"conditions":"Clear","description":"Clear conditions throughout the day.","icon":"clear-day","stations":null,"source":"fcst","hours":[{"datetime":"00:00:00","datetimeEpoch":1676671200,"temp":11.3,"feelslike":11.3,"humidity":67.49,"dew":5.5,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":18.7,"windspeed":7.2,"winddir":14.7,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"01:00:00","datetimeEpoch":1676674800,"temp":10.6,"feelslike":10.6,"humidity":71.19,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":18.0,"windspeed":6.5,"winddir":7.9,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"02:00:00","datetimeEpoch":1676678400,"temp":9.8,"feelslike":9.2,"humidity":76.15,"dew":5.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.5,"windspeed":6.1,"winddir":359.0,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"03:00:00","datetimeEpoch":1676682000,"temp":9.1,"feelslike":8.2,"humidity":80.37,"dew":5.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":16.2,"windspeed":6.8,"winddir":359.2,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"04:00:00","datetimeEpoch":1676685600,"temp":8.6,"feelslike":7.6,"humidity":83.71,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":16.6,"windspeed":6.8,"winddir":2.1,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"05:00:00","datetimeEpoch":1676689200,"temp":8.1,"feelslike":7.1,"humidity":86.6,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.8,"windspeed":6.5,"winddir":1.6,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"06:00:00","datetimeEpoch":1676692800,"temp":7.8,"feelslike":7.0,"humidity":88.38,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":14.8,"windspeed":5.8,"winddir":0.9,"pressure":1028.0,"visibility":24.1,"cloudcover":0.1,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"07:00:00","datetimeEpoch":1676696400,"temp":7.8,"feelslike":7.1,"humidity":87.78,"dew":5.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":13.7,"windspeed":5.4,"winddir":2.3,"pressure":1028.0,"visibility":24.1,"cloudcover":15.5,"solarradiation":7.0,"solarenergy":0.0,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"08:00:00","datetimeEpoch":1676700000,"temp":9.3,"feelslike":8.8,"humidity":78.75,"dew":5.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":14.8,"windspeed":5.4,"winddir":348.1,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":126.0,"solarenergy":0.5,"uvindex":1.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"09:00:00","datetimeEpoch":1676703600,"temp":11.9,"feelslike":11.9,"humidity":66.69,"dew":5.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":21.2,"windspeed":7.9,"winddir":1.1,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":332.0,"solarenergy":1.2,"uvindex":3.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"10:00:00","datetimeEpoch":1676707200,"temp":14.8,"feelslike":14.8,"humidity":54.44,"dew":5.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":26.6,"windspeed":9.7,"winddir":18.3,"pressure":1028.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":522.0,"solarenergy":1.9,"uvindex":5.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"11:00:00","datetimeEpoch":1676710800,"temp":17.0,"feelslike":17.0,"humidity":45.37,"dew":5.1,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":36.7,"windspeed":14.4,"winddir":40.9,"pressure":1027.0,"visibility":24.1,"cloudcover":28.3,"solarradiation":667.0,"solarenergy":2.4,"uvindex":7.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"12:00:00","datetimeEpoch":1676714400,"temp":18.3,"feelslike":18.3,"humidity":40.09,"dew":4.5,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":38.5,"windspeed":14.8,"winddir":37.8,"pressure":1026.0,"visibility":24.1,"cloudcover":9.0,"solarradiation":749.0,"solarenergy":2.7,"uvindex":7.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"13:00:00","datetimeEpoch":1676718000,"temp":19.2,"feelslike":19.2,"humidity":36.59,"dew":4.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":39.6,"windspeed":15.1,"winddir":34.3,"pressure":1026.0,"visibility":24.1,"cloudcover":12.0,"solarradiation":761.0,"solarenergy":2.7,"uvindex":8.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"14:00:00","datetimeEpoch":1676721600,"temp":20.0,"feelslike":20.0,"humidity":33.61,"dew":3.5,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":39.2,"windspeed":14.8,"winddir":33.4,"pressure":1025.0,"visibility":24.1,"cloudcover":14.4,"solarradiation":701.0,"solarenergy":2.5,"uvindex":7.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"15:00:00","datetimeEpoch":1676725200,"temp":20.3,"feelslike":20.3,"humidity":33.7,"dew":3.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":37.8,"windspeed":13.7,"winddir":32.9,"pressure":1025.0,"visibility":24.1,"cloudcover":25.8,"solarradiation":574.0,"solarenergy":2.1,"uvindex":6.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"16:00:00","datetimeEpoch":1676728800,"temp":20.1,"feelslike":20.1,"humidity":34.84,"dew":4.1,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":35.3,"windspeed":13.3,"winddir":34.2,"pressure":1025.0,"visibility":24.1,"cloudcover":39.9,"solarradiation":394.0,"solarenergy":1.4,"uvindex":4.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"17:00:00","datetimeEpoch":1676732400,"temp":19.4,"feelslike":19.4,"humidity":36.39,"dew":4.1,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.1,"windspeed":13.0,"winddir":36.7,"pressure":1025.0,"visibility":24.1,"cloudcover":45.8,"solarradiation":186.0,"solarenergy":0.7,"uvindex":2.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"18:00:00","datetimeEpoch":1676736000,"temp":18.1,"feelslike":18.1,"humidity":38.65,"dew":3.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":31.7,"windspeed":11.5,"winddir":31.2,"pressure":1025.0,"visibility":24.1,"cloudcover":36.8,"solarradiation":24.0,"solarenergy":0.1,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":null,"source":"fcst"},{"datetime":"19:00:00","datetimeEpoch":1676739600,"temp":16.7,"feelslike":16.7,"humidity":44.97,"dew":4.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.8,"windspeed":14.0,"winddir":31.6,"pressure":1026.0,"visibility":24.1,"cloudcover":16.9,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"20:00:00","datetimeEpoch":1676743200,"temp":15.2,"feelslike":15.2,"humidity":54.17,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":34.9,"windspeed":14.0,"winddir":33.8,"pressure":1026.0,"visibility":24.1,"cloudcover":13.7,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"21:00:00","datetimeEpoch":1676746800,"temp":14.2,"feelslike":14.2,"humidity":56.2,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.5,"windspeed":12.2,"winddir":39.0,"pressure":1026.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"22:00:00","datetimeEpoch":1676750400,"temp":13.3,"feelslike":13.3,"humidity":58.77,"dew":5.4,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":29.2,"windspeed":10.4,"winddir":36.0,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"23:00:00","datetimeEpoch":1676754000,"temp":12.4,"feelslike":12.4,"humidity":62.77,"dew":5.5,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":24.8,"windspeed":9.0,"winddir":31.1,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"}]},{"datetime":"2023-02-19","datetimeEpoch":1676757600,"tempmax":21.4,"tempmin":8.3,"temp":14.6,"feelslikemax":21.4,"feelslikemin":7.5,"feelslike":14.4,"dew":6.2,"humidity":60.4,"precip":0.0,"precipprob":0.0,"precipcover":0.0,"preciptype":null,"snow":0.0,"snowdepth":0.0,"windgust":40.0,"windspeed":15.5,"winddir":22.8,"pressure":1025.0,"cloudcover":7.6,"visibility":24.1,"solarradiation":211.5,"solarenergy":18.3,"uvindex":8.0,"severerisk":10.0,"sunrise":"06:31:44","sunriseEpoch":1676781104,"sunset":"17:46:34","sunsetEpoch":1676821594,"moonphase":0.97,"conditions":"Clear","description":"Clear conditions throughout the day.","icon":"clear-day","stations":null,"source":"fcst","hours":[{"datetime":"00:00:00","datetimeEpoch":1676757600,"temp":11.7,"feelslike":11.7,"humidity":66.65,"dew":5.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":20.9,"windspeed":7.6,"winddir":22.6,"pressure":1026.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"01:00:00","datetimeEpoch":1676761200,"temp":11.1,"feelslike":11.1,"humidity":70.8,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":18.0,"windspeed":6.8,"winddir":14.0,"pressure":1026.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"02:00:00","datetimeEpoch":1676764800,"temp":10.4,"feelslike":10.4,"humidity":74.69,"dew":6.1,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":18.0,"windspeed":7.6,"winddir":8.5,"pressure":1026.0,"visibility":24.1,"cloudcover":0.1,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"03:00:00","datetimeEpoch":1676768400,"temp":9.8,"feelslike":8.9,"humidity":78.83,"dew":6.3,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":18.0,"windspeed":7.2,"winddir":5.3,"pressure":1026.0,"visibility":24.1,"cloudcover":0.1,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"04:00:00","datetimeEpoch":1676772000,"temp":9.1,"feelslike":8.3,"humidity":83.2,"dew":6.4,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":17.3,"windspeed":6.5,"winddir":0.7,"pressure":1026.0,"visibility":24.1,"cloudcover":0.1,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"05:00:00","datetimeEpoch":1676775600,"temp":8.8,"feelslike":7.9,"humidity":86.07,"dew":6.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.5,"windspeed":6.5,"winddir":2.8,"pressure":1025.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"06:00:00","datetimeEpoch":1676779200,"temp":8.4,"feelslike":7.7,"humidity":89.05,"dew":6.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":15.1,"windspeed":5.8,"winddir":1.8,"pressure":1026.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"07:00:00","datetimeEpoch":1676782800,"temp":8.3,"feelslike":7.5,"humidity":89.65,"dew":6.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":13.7,"windspeed":5.8,"winddir":358.9,"pressure":1026.0,"visibility":24.1,"cloudcover":0.1,"solarradiation":7.0,"solarenergy":0.0,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"08:00:00","datetimeEpoch":1676786400,"temp":9.9,"feelslike":9.1,"humidity":79.94,"dew":6.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":16.9,"windspeed":6.8,"winddir":356.2,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":129.0,"solarenergy":0.5,"uvindex":1.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"09:00:00","datetimeEpoch":1676790000,"temp":12.4,"feelslike":12.4,"humidity":67.72,"dew":6.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":22.7,"windspeed":8.6,"winddir":1.1,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":334.0,"solarenergy":1.2,"uvindex":3.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"10:00:00","datetimeEpoch":1676793600,"temp":15.2,"feelslike":15.2,"humidity":56.85,"dew":6.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":30.2,"windspeed":11.5,"winddir":16.4,"pressure":1027.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":525.0,"solarenergy":1.9,"uvindex":5.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"11:00:00","datetimeEpoch":1676797200,"temp":17.5,"feelslike":17.5,"humidity":46.15,"dew":5.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":38.9,"windspeed":15.1,"winddir":34.3,"pressure":1026.0,"visibility":24.1,"cloudcover":12.9,"solarradiation":670.0,"solarenergy":2.4,"uvindex":7.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"12:00:00","datetimeEpoch":1676800800,"temp":18.8,"feelslike":18.8,"humidity":41.08,"dew":5.3,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":40.0,"windspeed":15.5,"winddir":32.5,"pressure":1025.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":752.0,"solarenergy":2.7,"uvindex":8.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"13:00:00","datetimeEpoch":1676804400,"temp":20.1,"feelslike":20.1,"humidity":38.15,"dew":5.4,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":39.6,"windspeed":15.1,"winddir":29.7,"pressure":1024.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":764.0,"solarenergy":2.8,"uvindex":8.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"14:00:00","datetimeEpoch":1676808000,"temp":21.1,"feelslike":21.1,"humidity":34.4,"dew":4.8,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":38.5,"windspeed":14.8,"winddir":27.6,"pressure":1023.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":704.0,"solarenergy":2.5,"uvindex":7.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"15:00:00","datetimeEpoch":1676811600,"temp":21.4,"feelslike":21.4,"humidity":34.01,"dew":4.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":37.8,"windspeed":14.8,"winddir":25.9,"pressure":1023.0,"visibility":24.1,"cloudcover":11.2,"solarradiation":577.0,"solarenergy":2.1,"uvindex":6.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-day","stations":null,"source":"fcst"},{"datetime":"16:00:00","datetimeEpoch":1676815200,"temp":21.2,"feelslike":21.2,"humidity":36.91,"dew":5.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":37.1,"windspeed":14.0,"winddir":26.1,"pressure":1022.0,"visibility":24.1,"cloudcover":35.4,"solarradiation":397.0,"solarenergy":1.4,"uvindex":4.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"17:00:00","datetimeEpoch":1676818800,"temp":20.3,"feelslike":20.3,"humidity":38.21,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":34.9,"windspeed":13.7,"winddir":25.6,"pressure":1023.0,"visibility":24.1,"cloudcover":36.7,"solarradiation":190.0,"solarenergy":0.7,"uvindex":2.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-day","stations":null,"source":"fcst"},{"datetime":"18:00:00","datetimeEpoch":1676822400,"temp":19.0,"feelslike":19.0,"humidity":41.42,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.5,"windspeed":11.9,"winddir":26.4,"pressure":1023.0,"visibility":24.1,"cloudcover":40.2,"solarradiation":26.0,"solarenergy":0.1,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":null,"source":"fcst"},{"datetime":"19:00:00","datetimeEpoch":1676826000,"temp":17.6,"feelslike":17.6,"humidity":45.23,"dew":5.6,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":29.9,"windspeed":12.6,"winddir":29.7,"pressure":1024.0,"visibility":24.1,"cloudcover":26.6,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":null,"source":"fcst"},{"datetime":"20:00:00","datetimeEpoch":1676829600,"temp":16.1,"feelslike":16.1,"humidity":52.93,"dew":6.5,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.1,"windspeed":13.7,"winddir":39.6,"pressure":1024.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"21:00:00","datetimeEpoch":1676833200,"temp":14.9,"feelslike":14.9,"humidity":60.39,"dew":7.3,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":33.1,"windspeed":13.0,"winddir":40.0,"pressure":1024.0,"visibility":24.1,"cloudcover":0.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"22:00:00","datetimeEpoch":1676836800,"temp":13.9,"feelslike":13.9,"humidity":66.21,"dew":7.7,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":31.3,"windspeed":11.2,"winddir":30.9,"pressure":1025.0,"visibility":24.1,"cloudcover":7.2,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"},{"datetime":"23:00:00","datetimeEpoch":1676840400,"temp":12.9,"feelslike":12.9,"humidity":71.63,"dew":7.9,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":25.9,"windspeed":9.4,"winddir":18.3,"pressure":1025.0,"visibility":24.1,"cloudcover":11.4,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"severerisk":10.0,"conditions":"Clear","icon":"clear-night","stations":null,"source":"fcst"}]}]
/// stations : {"HECA":{"distance":18512.0,"latitude":30.13,"longitude":31.4,"useCount":0,"id":"HECA","name":"HECA","quality":50,"contribution":0.0}}

class WeatherTimeline extends Equatable{
  WeatherTimeline({
      this.queryCost, 
      this.latitude, 
      this.longitude, 
      this.resolvedAddress, 
      this.address, 
      this.timezone, 
      this.tzoffset, 
      this.days, });

  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  List<Days>? days;

  @override
  List<Object?> get props => [this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,];

}



/// datetime : "00:00:00"
/// datetimeEpoch : 1676584800
/// temp : 13.0
/// feelslike : 13.0
/// humidity : 66.92
/// dew : 7.0
/// precip : 0.0
/// precipprob : 0.0
/// snow : 0.0
/// snowdepth : 0.0
/// preciptype : null
/// windgust : 15.1
/// windspeed : 5.4
/// winddir : 60.0
/// pressure : 1027.0
/// visibility : 6.0
/// cloudcover : 46.9
/// solarradiation : 0.0
/// solarenergy : null
/// uvindex : 0.0
/// severerisk : 10.0
/// conditions : "Partially cloudy"
/// icon : "partly-cloudy-night"
/// stations : ["HECA"]
/// source : "obs"

class Hours extends Equatable{
  Hours({
      this.datetime, 
      this.datetimeEpoch, 
      this.temp, 
      this.feelslike, 
      this.humidity, 
      this.dew, 
      this.precip, 
      this.precipprob, 
      this.snow, 
      this.snowdepth, 
      this.preciptype, 
      this.windgust, 
      this.windspeed, 
      this.winddir, 
      this.pressure, 
      this.visibility, 
      this.cloudcover, 
      this.solarradiation, 
      this.solarenergy, 
      this.uvindex, 
      this.severerisk, 
      this.conditions, 
      this.icon, 
      this.stations, 
      this.source,});

  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  dynamic preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  dynamic solarenergy;
  double? uvindex;
  double? severerisk;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;
Hours copyWith({  String? datetime,
  int? datetimeEpoch,
  double? temp,
  double? feelslike,
  double? humidity,
  double? dew,
  double? precip,
  double? precipprob,
  double? snow,
  double? snowdepth,
  dynamic preciptype,
  double? windgust,
  double? windspeed,
  double? winddir,
  double? pressure,
  double? visibility,
  double? cloudcover,
  double? solarradiation,
  dynamic solarenergy,
  double? uvindex,
  double? severerisk,
  String? conditions,
  String? icon,
  List<String>? stations,
  String? source,
}) => Hours(  datetime: datetime ?? this.datetime,
  datetimeEpoch: datetimeEpoch ?? this.datetimeEpoch,
  temp: temp ?? this.temp,
  feelslike: feelslike ?? this.feelslike,
  humidity: humidity ?? this.humidity,
  dew: dew ?? this.dew,
  precip: precip ?? this.precip,
  precipprob: precipprob ?? this.precipprob,
  snow: snow ?? this.snow,
  snowdepth: snowdepth ?? this.snowdepth,
  preciptype: preciptype ?? this.preciptype,
  windgust: windgust ?? this.windgust,
  windspeed: windspeed ?? this.windspeed,
  winddir: winddir ?? this.winddir,
  pressure: pressure ?? this.pressure,
  visibility: visibility ?? this.visibility,
  cloudcover: cloudcover ?? this.cloudcover,
  solarradiation: solarradiation ?? this.solarradiation,
  solarenergy: solarenergy ?? this.solarenergy,
  uvindex: uvindex ?? this.uvindex,
  severerisk: severerisk ?? this.severerisk,
  conditions: conditions ?? this.conditions,
  icon: icon ?? this.icon,
  stations: stations ?? this.stations,
  source: source ?? this.source,
);

  @override
  List<Object?> get props => [
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
  ];

}