class WeatherModel {
  final String city;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String image;
  final String condition;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.image,
      required this.condition});

  factory WeatherModel.fromjson(json) {
    Map<String, dynamic> today = json["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        city: json["location"]["name"],
        date: DateTime.parse(json["location"]["localtime"]),
        maxTemp: today["maxtemp_c"],
        minTemp: today["mintemp_c"],
        avgTemp: today["avgtemp_c"],
        image: today["condition"]["icon"],
        condition: today["condition"]["text"]);
  }
}
