import 'package:flutter/cupertino.dart';
import 'package:flutter_task/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider with ChangeNotifier {
  static const String URL = 'https://api.openweathermap.org/data/2.5/forecast?id=292223&units=metric&appid=9963c1498e15618c2d24ceebd68d2ec8';

  List<WeatherModel> _weatherModels = [];

  List<WeatherModel> get weatherModels => [..._weatherModels];

  Future<void> getWeatherData() async {
    final response = await http.get(Uri.parse(URL));
    List<WeatherModel> fetchedWeatherModels = [];

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      List<dynamic> weatherData = decodedData['list'];

      //in order to get one data for each day (each day has 8 data by hour)
      for (int i = 0; i < weatherData.length; i = i + 8) {
       fetchedWeatherModels.add(WeatherModel.fromJson(weatherData[i]));
      }

      _weatherModels = fetchedWeatherModels;
    }

    notifyListeners();
  }

  WeatherModel getWeatherByDay(DateTime weatherDate) {
    final weatherModel = _weatherModels.firstWhere((weatherModel) => weatherModel.weatherDate == weatherDate);
    return weatherModel;
  }
}
