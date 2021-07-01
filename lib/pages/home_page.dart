import 'package:flutter/material.dart';
import 'package:flutter_task/constants.dart';
import 'package:flutter_task/providers/weather_provider.dart';
import 'package:flutter_task/widgets/day_item.dart';
import 'package:flutter_task/widgets/home_background.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: HomeBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Dubai Weather',
              style: kTitleTextStyle,
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Container(
              height: height * 0.3,
              child: FutureBuilder(
                future: provider.getWeatherData(),
                builder: (ctx, snapshot) {
                  if (snapshot.error != null) {
                    return Container(
                      child: Center(
                        child: Text(
                          'Please check your internet connection and try again',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (ctx, index) => DayItem(
                        weatherDate: provider.weatherModels[index].weatherDate,
                        weatherDescription: provider.weatherModels[index].description,
                        temp: provider.weatherModels[index].temp,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.7)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
