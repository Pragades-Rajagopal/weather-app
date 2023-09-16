import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
  color: Colors.white,
);
TextStyle infoFont = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  color: Colors.white,
);

Widget additionalInformation(
  String wind,
  String humidity,
  String pressure,
  String feelsLike,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'wind',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'pressure',
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wind,
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  pressure,
                  style: infoFont,
                ),
              ],
            ),
            const SizedBox(
              height: 80,
              child: VerticalDivider(
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'humidity',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'feels like',
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  humidity,
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  feelsLike,
                  style: infoFont,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
