class Weather {
  final String tempMax;
  final String tempMin;
  final String tempCurrent;
  final String dt;
  final DateTime date;
  final String mainDescription;
  final String detailedDescription;
  final String image;
  final bool isImageNetwork;
  final String lat;
  final String lon;
  final String rain;
  final String windSpeed;
  final String windDeg;
  final String feelsLike;
  final bool isMetric;
  final List<Weather> weatherTimeline;
  final String humidity;
  final String pressure;
  final String uvi;
  final String visibility;
  final String clouds;

  Weather({
    this.tempMax = "0.0",
    this.dt = "0",
    this.tempMin = "0.0",
    this.tempCurrent = "0.0",
    DateTime date,
    this.detailedDescription = "",
    this.mainDescription = "",
    this.image = 'assets/weather_status/clear.png',
    this.isImageNetwork = false,
    this.lat = "",
    this.lon = "",
    this.windDeg = '',
    this.windSpeed = '',
    this.rain = "0.0",
    this.humidity = "0.0",
    this.visibility = "0.0",
    this.uvi = "0.0",
    this.pressure = "0.0",
    this.clouds = "0.0",
    this.feelsLike = "",
    this.isMetric = true,
    this.weatherTimeline,
  }) : date = date ??
            DateTime
                .now().toUtc(); // This means date equals to second date, but if second date is null then a equals DateTime.now()

Comparator<Weather> sortByDt = (a,b) => double.tryParse(a.dt).round()-double.tryParse(b.dt).round();
Comparator<Weather> sortByDate = (a,b) => a.date.difference(b.date).inSeconds;
Comparator<Weather> sortByTemp = (a,b) => double.tryParse(a.tempCurrent).round()-double.tryParse(b.tempCurrent).round();
}
