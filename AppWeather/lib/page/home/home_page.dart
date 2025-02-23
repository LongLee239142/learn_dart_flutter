import 'package:app_weather/models/weather.dart';
import 'package:app_weather/page/home/widgets/home_detail_weather.dart';
import 'package:app_weather/page/home/widgets/home_location.dart';
import 'package:app_weather/page/home/widgets/home_temperature.dart';
import 'package:app_weather/page/home/widgets/home_weather_icon.dart';
import 'package:app_weather/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              WeatherData data = snapshot.data as WeatherData;
              print(data.weather[0].main);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeWeatherIcon(nameIcons: data.weather[0].main,),
                  HomeTemperature(temp: data.main.temp.toString() ),
                  HomeLocation(name: data.name.toString(),),
                  SizedBox(height: 40),
                  HomeDetailWeather(speedWind: data.wind.speed.toString(), humi: data.wind.deg.toString(),),
                ],
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
