class Weather {
  String? cityName;
  int? temp;
  double? wind;
  int? humidity;
  int? feelsLike;
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

  /// Function to parse JSON data into model

  Weather.fromJSON(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = roundTempValue(json["main"]["temp"]);
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feelsLike = roundTempValue(json["main"]["feels_like"]);
    description = json["weather"][0]["description"];
    icon = json["weather"][0]["icon"];
    country = json["sys"]["country"];
  }

  // Function to return json when unknown city is searched

  Weather.voidData() {
    cityName = '';
    temp = 0;
    wind = 0.0;
    humidity = 0;
    pressure = 0;
    feelsLike = 0;
    description = '';
    icon = '10n';
    country = '';
  }

  int roundTempValue(double temp) {
    return temp.round();
  }
}
