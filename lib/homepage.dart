import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/cities_api.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/widgets/additional_info.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/daily_forecast.dart';

BorderRadius searchBarRadius = BorderRadius.circular(30.0);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  // setting default search city
  var searchCity = 'oslo';

  WeatherApi client = WeatherApi();
  Weather? data;
  DailyWeather? dailyData;
  CitiesApi cities = CitiesApi();
  List<String> citiesData = [];

  Future<void> getData(String city) async {
    data = await client.getCurrentWeather(city);
    dailyData = await client.getDailyWeather(data?.lat, data?.lon);
  }

  Future<void> getCitiesFunc() async {
    citiesData = await cities.getCities();
  }

  @override
  Widget build(BuildContext context) {
    getCitiesFunc();
    return Scaffold(
      backgroundColor: const Color(0xFF0F1026),
      appBar: weatherAppBar(),
      body: Column(
        children: [
          weatherAppSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  weatherFutureBuilder(searchCity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherAppSearch() {
    GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: SimpleAutoCompleteTextField(
                key: key,
                controller: textController,
                suggestions: citiesData,
                suggestionsAmount: 6,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: 'search city',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: searchBarRadius,
                    borderSide: const BorderSide(
                      width: 0.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: searchBarRadius,
                    borderSide: const BorderSide(
                      color: Colors.white10,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                  prefixIcon: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      textController.text = '';
                    },
                  ),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (textController.text != '') {
                        setState(() {
                          searchCity = textController.text;
                        });
                        textController.text = '';
                      }
                    },
                  ),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textSubmitted: (data) {
                  if (textController.text != '') {
                    setState(() {
                      searchCity = textController.text;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<void> weatherFutureBuilder(String city) {
    return FutureBuilder(
      future: getData(city),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.done) {
            if (data?.cityName == '') {
              return const Center(
                child: Text(
                  "Oops! \nWeather info not available. Please search for another city.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return weatherColumn(data);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        } catch (e) {
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }

  SingleChildScrollView weatherColumn(data) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(
            getIcon(data!.icon),
            "${data!.temp}°C",
            "${data!.cityName}",
            "${data!.description}",
            "${data!.country}",
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'additional information',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          additionalInformation(
            "${data!.wind}m/s",
            "${data!.humidity}%",
            "${data!.pressure}hPa",
            "${data!.feelsLike}°C",
            "${data!.degree}",
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'daily forecast',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          dailyForecast(dailyData!.model),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: SizedBox(
              width: 240,
              height: 50,
              child: Text(
                'Data provided by OpenWeather',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image getIcon(String icon) {
    String url = "https://openweathermap.org/img/wn/$icon@4x.png";
    return Image.network(url);
  }

  AppBar weatherAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      forceMaterialTransparency: false,
      title: const Text('weather app'),
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 24.0,
        color: const Color(0xFF2979FF),
      ),
    );
  }
}
