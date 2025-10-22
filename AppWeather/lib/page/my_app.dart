
import 'package:app_weather/apps/config/them_custom.dart';
import 'package:app_weather/page/button_navigation_custom/button_custom.dart';
import 'package:app_weather/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.positionCurrent});
  final Position? positionCurrent;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        WeatherProvider provider = WeatherProvider();
        if (positionCurrent != null) {
          provider.updatePosition(positionCurrent!);
        }
        return provider;
      },
      child: MaterialApp(
        theme: ThemCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: ButtonNavigationCustom(),
      ),
    );
  }
}
