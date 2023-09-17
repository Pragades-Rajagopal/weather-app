import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   Position? currentPosition;
    //   Future<Position> getLocation() async {
    //     await Geolocator.requestPermission();
    //     Position position = await Geolocator.getCurrentPosition(
    //         desiredAccuracy: LocationAccuracy.high);
    //     return position;
    //   }
    //   Future<List<Placemark>> getGeoLocation() async {
    //     currentPosition = await getLocation();
    //     return await placemarkFromCoordinates(
    //       currentPosition!.latitude,
    //       currentPosition!.longitude,
    //     );
    //   }
    //   print(getGeoLocation());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(),
          bodyMedium: GoogleFonts.poppins(),
          bodySmall: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
