import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';

import 'present_future_weather.dart';

/// lat : 30.0444
/// lon : 31.2357
/// timezone : "Africa/Cairo"
/// timezone_offset : 7200
/// current : {"dt":1671048851,"sunrise":1670992968,"sunset":1671029794,"temp":19.33,"feels_like":18.75,"pressure":1017,"humidity":55,"dew_point":10.07,"uvi":0,"clouds":18,"visibility":6000,"wind_speed":0,"wind_deg":0,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]}
/// hourly : [{"dt":1670976000,"temp":19.33,"feels_like":18.96,"pressure":1015,"humidity":63,"dew_point":12.12,"uvi":0,"clouds":40,"visibility":4000,"wind_speed":2.06,"wind_deg":200,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50n"}]},{"dt":1670979600,"temp":19.33,"feels_like":18.96,"pressure":1015,"humidity":63,"dew_point":12.12,"uvi":0,"clouds":40,"visibility":4000,"wind_speed":2.57,"wind_deg":180,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50n"}]},{"dt":1670983200,"temp":19.33,"feels_like":18.96,"pressure":1014,"humidity":63,"dew_point":12.12,"uvi":0,"clouds":40,"visibility":4000,"wind_speed":3.09,"wind_deg":170,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50n"}]},{"dt":1670986800,"temp":18.33,"feels_like":17.99,"pressure":1014,"humidity":68,"dew_point":12.33,"uvi":0,"clouds":40,"visibility":4000,"wind_speed":2.57,"wind_deg":180,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50n"}]},{"dt":1670990400,"temp":18.33,"feels_like":17.99,"pressure":1015,"humidity":68,"dew_point":12.33,"uvi":0,"clouds":39,"visibility":4000,"wind_speed":2.06,"wind_deg":200,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50n"}]},{"dt":1670994000,"temp":18.33,"feels_like":17.99,"pressure":1015,"humidity":68,"dew_point":12.33,"uvi":0,"clouds":49,"visibility":4000,"wind_speed":2.57,"wind_deg":190,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}]},{"dt":1670997600,"temp":18.33,"feels_like":17.99,"pressure":1016,"humidity":68,"dew_point":12.33,"uvi":0.32,"clouds":40,"visibility":3000,"wind_speed":1.54,"wind_deg":200,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}]},{"dt":1671001200,"temp":20.33,"feels_like":19.88,"pressure":1016,"humidity":56,"dew_point":11.27,"uvi":0.88,"clouds":46,"visibility":4000,"wind_speed":4.63,"wind_deg":190,"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}]},{"dt":1671004800,"temp":21.33,"feels_like":20.88,"pressure":1017,"humidity":52,"dew_point":11.08,"uvi":1.68,"clouds":62,"visibility":6000,"wind_speed":3.09,"wind_deg":200,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}]},{"dt":1671008400,"temp":22.33,"feels_like":21.9,"pressure":1016,"humidity":49,"dew_point":11.11,"uvi":2.37,"clouds":0,"visibility":10000,"wind_speed":4.63,"wind_deg":210,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1671012000,"temp":22.33,"feels_like":21.82,"pressure":1016,"humidity":46,"dew_point":10.16,"uvi":2.9,"clouds":0,"visibility":10000,"wind_speed":4.12,"wind_deg":210,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1671015600,"temp":23.33,"feels_like":22.84,"pressure":1015,"humidity":43,"dew_point":10.06,"uvi":2.54,"clouds":0,"visibility":10000,"wind_speed":3.6,"wind_deg":240,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1671019200,"temp":24.33,"feels_like":23.81,"pressure":1015,"humidity":38,"dew_point":9.12,"uvi":1.74,"clouds":20,"visibility":10000,"wind_speed":3.6,"wind_deg":220,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1671022800,"temp":24.33,"feels_like":23.81,"pressure":1015,"humidity":38,"dew_point":9.12,"uvi":0.89,"clouds":20,"visibility":10000,"wind_speed":2.57,"wind_deg":260,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1671026400,"temp":23.33,"feels_like":22.84,"pressure":1015,"humidity":43,"dew_point":10.06,"uvi":0.26,"clouds":20,"visibility":10000,"wind_speed":3.6,"wind_deg":290,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1671030000,"temp":23.33,"feels_like":22.92,"pressure":1016,"humidity":46,"dew_point":11.07,"uvi":0,"clouds":40,"visibility":10000,"wind_speed":3.09,"wind_deg":310,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]},{"dt":1671033600,"temp":22.33,"feels_like":21.82,"pressure":1016,"humidity":46,"dew_point":10.16,"uvi":0,"clouds":40,"visibility":10000,"wind_speed":0,"wind_deg":0,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]},{"dt":1671037200,"temp":21.33,"feels_like":20.88,"pressure":1017,"humidity":52,"dew_point":11.08,"uvi":0,"clouds":40,"visibility":10000,"wind_speed":0,"wind_deg":0,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]},{"dt":1671040800,"temp":21.33,"feels_like":20.88,"pressure":1017,"humidity":52,"dew_point":11.08,"uvi":0,"clouds":40,"visibility":6000,"wind_speed":0,"wind_deg":0,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]},{"dt":1671044400,"temp":20.33,"feels_like":19.88,"pressure":1017,"humidity":56,"dew_point":11.27,"uvi":0,"clouds":18,"visibility":6000,"wind_speed":1.54,"wind_deg":40,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1671048000,"temp":19.33,"feels_like":18.75,"pressure":1017,"humidity":55,"dew_point":10.07,"uvi":0,"clouds":18,"visibility":6000,"wind_speed":0,"wind_deg":0,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]}]

class HistoryWeather extends Equatable {
  HistoryWeather({
      this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,});

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;

  num? get getTempMin {
    List<num?> temps = _getTempsMinToMax();
    return temps.tryFirst;
  }

  num? get getTempMax {
    List<num?> temps = _getTempsMinToMax();
    printDebug("temps are $temps");
    return temps.tryElementAt(temps.length - 1);
  }

  List<num?> _getTempsMinToMax() {
    List<num?> temps = [];
    hourly?.forEach((element) {temps.add(element.temp??0);});
    temps.sort();
    return temps;
  }@override
  List<Object?> get props => [this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,];

}
