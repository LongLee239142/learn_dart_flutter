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
              return CircularProgressIndicator(color: Colors.white);
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_off, size: 80, color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      'Lỗi vị trí',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
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
