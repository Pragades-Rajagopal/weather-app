import 'package:flutter/services.dart';

Future<Map<String, String>> parseStringToMap(
    {String assetsFileName = '.env'}) async {
  final lines = await rootBundle.loadString(assetsFileName);
  Map<String, String> environment = {};
  for (String line in lines.split('\n')) {
    line = line.trim();
    if (line.contains('=') //Set Key Value Pairs on lines separated by =
        &&
        !line.startsWith(RegExp(r'=|#'))) {
      //No need to add emty keys and remove comments
      List<String> contents = line.split('=');
      environment[contents[0]] = contents.sublist(1).join('=');
    }
  }
  return environment;
}
