String windDirection(int windDegrees)
{
  final directions = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"];
  return  '${directions[(windDegrees/22.5).round()]}';
}