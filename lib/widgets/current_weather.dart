import 'package:flutter/material.dart';

Image getIcon(String icon) {
  String url = "https://openweathermap.org/img/wn/$icon@4x.png";
  return Image.network(url);
}

Widget currentWeather(
  String icon,
  String temp,
  String location,
  String description,
  String country,
) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            child: getIcon(icon),
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 48.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$location, $country",
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
