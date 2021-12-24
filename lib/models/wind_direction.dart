String windDirection(int windDegrees)
{
  final directions = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"];
  print((windDegrees/22.5).round());
  print(directions[(windDegrees/22.5).round()]);
  return  '${directions[(windDegrees/22.5).round()]}';
}