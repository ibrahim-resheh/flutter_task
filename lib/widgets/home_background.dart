import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;

  HomeBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/dubai.jpg'),
        ),
      ),
      child: child,
    );
  }
}
