import 'package:flutter/material.dart';

SizedBox div = const SizedBox(height: 16);
var containerTitleStyle = TextStyle(
  fontSize: 16,
  color: Colors.grey[400],
);
var containerInfoStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.grey[400],
);
Color containerColor = Colors.blueGrey.withOpacity(0.3);

Widget additionalInformation(
  String wind,
  String humidity,
  String pressure,
  String feelsLike,
  String? degree,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 165,
              height: 100,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: containerColor,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "wind",
                        style: containerTitleStyle,
                      )
                    ],
                  ),
                  div,
                  Row(
                    children: [
                      Text(
                        wind,
                        style: containerInfoStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 165,
              height: 100,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: containerColor,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "humidity",
                        style: containerTitleStyle,
                      )
                    ],
                  ),
                  div,
                  Row(
                    children: [
                      Text(
                        humidity,
                        style: containerInfoStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        div,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 165,
              height: 100,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: containerColor,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "pressure",
                        style: containerTitleStyle,
                      )
                    ],
                  ),
                  div,
                  Row(
                    children: [
                      Text(
                        pressure,
                        style: containerInfoStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 165,
              height: 100,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: containerColor,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "feels like",
                        style: containerTitleStyle,
                      )
                    ],
                  ),
                  div,
                  Row(
                    children: [
                      Text(
                        feelsLike,
                        style: containerInfoStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
