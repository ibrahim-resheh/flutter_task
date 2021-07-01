import 'package:flutter/cupertino.dart';

class WeatherModel {
  DateTime weatherDate;
  String mainText;
  String description;
  String iconCode;
  double windSpeed;
  double temp;
  double minTemp;
  double maxTemp;
  int seaLevel;
  int humidity;

  WeatherModel.fromJson(Map<String, dynamic> decodedData) {

      this.weatherDate = DateTime.parse(decodedData['dt_txt']);
      this.mainText = decodedData['weather'][0]['main'];
      this.description = decodedData['weather'][0]['description'];
      this.iconCode = decodedData['weather'][0]['icon'];
      this.windSpeed = decodedData['wind']['speed'];
      this.temp = decodedData['main']['temp'];
      this.minTemp = decodedData['main']['temp_min'];
      this.maxTemp = decodedData['main']['temp_max'];
      this.seaLevel = decodedData['main']['sea_level'];
      this.humidity = decodedData['main']['humidity'];
  }

}
