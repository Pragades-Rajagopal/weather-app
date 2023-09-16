import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/widgets/additional_info.dart';
import 'package:weather_app/widgets/current_weather.dart';

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

  Future<void> getData(String city) async {
    data = await client.getCurrentWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: weatherAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            weatherAppBody(),
            weatherFutureBuilder(searchCity),
          ],
        ),
      ),
    );
  }

  /// needs work
  Widget weatherAppBody() {
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
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'search city',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: const Text(
                'search',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () {
              if (textController.text != '') {
                setState(() {
                  searchCity = textController.text;
                  // showWeather = true;
                });
              }
            },
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
          const SizedBox(
            height: 10.0,
          ),
          currentWeather(
            "${data!.icon}",
            "${data!.temp} °C",
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
          const Divider(
            color: Colors.blueGrey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          additionalInformation(
            "${data!.wind} m/s",
            "${data!.humidity} %",
            "${data!.pressure} bar",
            "${data!.feelsLike} °C",
          ),
        ],
      ),
    );
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
        color: Colors.lightBlue,
      ),
    );
  }
}
