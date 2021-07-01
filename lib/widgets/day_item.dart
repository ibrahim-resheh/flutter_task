import 'package:flutter/material.dart';
import 'package:flutter_task/constants.dart';
import 'package:flutter_task/models/weather_model.dart';
import 'package:flutter_task/pages/day_page.dart';


class DayItem extends StatelessWidget {
  final DateTime weatherDate;
  final String weatherDescription;
  final double temp;

  DayItem({
    @required this.weatherDate,
    @required this.weatherDescription,
    @required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DayPage.routeName, arguments: {
          'date': weatherDate,
        });
      },
      child: Container(
        width: width * 0.5,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '${weatherDate.month}/${weatherDate.day}',
                style: kDateTextStyle,
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  '$weatherDescription',
                  style: kDescTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '${temp.round()}',
                style: kDateTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
