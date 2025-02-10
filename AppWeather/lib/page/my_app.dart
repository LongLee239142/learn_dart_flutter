
import 'package:app_weather/apps/config/them_custom.dart';
import 'package:app_weather/page/button_navigation_custom/button_custom.dart';
import 'package:app_weather/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        theme: ThemCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: ButtonNavigationCustom(),
      ),
    );
  }
}
