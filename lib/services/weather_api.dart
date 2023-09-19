import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/config/dotenv_config.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherApi {
  Future<Weather> getCurrentWeather(String? city) async {
    try {
      // Get the API key from .env file
      final env = await parseStringToMap(assetsFileName: '.env');

      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${env["OPENWEATHER_API_KEY"]}&units=metric');
      var response = await http.get(url);
      var body = jsonDecode(response.body);
      Weather weather = Weather.fromJSON(body);
      return weather;
    } catch (e) {
      return Weather.voidData();
    }
  }
}
