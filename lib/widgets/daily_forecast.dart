import 'package:flutter/material.dart';

var cardDateStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.grey[400],
);

var cardTempStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.grey[400],
);

var cardDescrStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey[400],
);

Image getIcon(String icon) {
  String url = "https://openweathermap.org/img/wn/$icon@4x.png";
  return Image.network(url);
}

Widget dailyForecast(List data) {
  if (data[0]["err"] == 1) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "Daily forecast data unavailable!",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  } else {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blueGrey.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        data[index]["dt"],
                        style: cardDateStyle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        // vertical: 20,
                      ),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: getIcon(data[index]["icon"]),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${data[index]["tempMax"]} / ${data[index]["tempMin"]}°C",
                                style: cardTempStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  data[index]["description"],
                                  style: cardDescrStyle,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
