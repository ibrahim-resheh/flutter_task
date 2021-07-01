import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/pages/day_page.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  //set status bar to transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // //systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: FlutterTask(),
    ),
  );
}

class FlutterTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DayPage.routeName: (context) => DayPage(),
      },
    );
  }
}
