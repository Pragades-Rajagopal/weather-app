class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  String? description;
  String? icon;
  String? country;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.feelsLike,
    this.description,
    this.icon,
    this.country,
  });

  /// Funtion to parse JSON data into model

  Weather.fromJSON(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feelsLike = json["main"]["feels_like"];
    description = json["weather"][0]["description"];
    icon = json["weather"][0]["icon"];
    country = json["sys"]["country"];
  }
}
