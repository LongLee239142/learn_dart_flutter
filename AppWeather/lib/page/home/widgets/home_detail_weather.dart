import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  String speedWind;
  String humi;

  HomeDetailWeather({
    super.key,
    required this.speedWind,
    required this.humi,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/wind.png'),
            Text(
              '$speedWind km/h',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '$humi'+'%',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
