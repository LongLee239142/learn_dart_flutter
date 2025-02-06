import 'package:app_weather/apps/utils/const.dart';
import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
   HomeWeatherIcon({super.key, required this.nameIcons});
  String nameIcons;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 1.5,
      padding: EdgeInsets.all(20),
      child: Image.asset(
        AssetCustom.getLinkImage(nameIcons),
        fit: BoxFit.cover,
      ),
    );
  }
}
