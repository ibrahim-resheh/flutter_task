import 'package:flutter/material.dart';
import 'package:flutter_task/constants.dart';
import 'package:flutter_task/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class DayPage extends StatelessWidget {
  static const routeName = '/day_page';

  Widget _buildRow(IconData iconData, String text) {
    return Container(
      height: 50,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Icon(iconData),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    final data = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final date = data['date'];
    final dayWeatherModel = provider.getWeatherByDay(date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dubai Weather',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 0.5,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${dayWeatherModel.weatherDate.month}/${dayWeatherModel.weatherDate.day}',
                    style: kDateTextStyle,
                  ),
                  Image.network(
                      'http://openweathermap.org/img/w/${dayWeatherModel.iconCode}.png'),
                  Text(
                    '${dayWeatherModel.mainText.toUpperCase()}',
                    style: kDescTextStyle,
                  ),
                  Text(
                    '${dayWeatherModel.description.toUpperCase()}',
                    style: kDescTextStyle,
                  ),
                  Text(
                    '${dayWeatherModel.temp.round()}',
                    style: kDateTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildRow(WeatherIcons.windy,
                      'Wind Speed: ${dayWeatherModel.windSpeed}'),
                  _buildRow(WeatherIcons.celsius,
                      'Min Temp: ${dayWeatherModel.minTemp.round()}'),
                  _buildRow(WeatherIcons.celsius,
                      'Max Temp: ${dayWeatherModel.maxTemp.round()}'),
                  _buildRow(WeatherIcons.humidity,
                      'Humidity Speed: ${dayWeatherModel.humidity}'),
                  _buildRow(WeatherIcons.horizon,
                      'Sea Level: ${dayWeatherModel.seaLevel}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
