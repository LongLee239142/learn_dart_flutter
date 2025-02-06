import 'package:app_weather/models/weather.dart';
import 'package:app_weather/repositories/api_repository.dart';
import 'package:flutter/cupertino.dart';

class WeatherProvider extends ChangeNotifier{
  Future<WeatherData> getWeatherCurrent() async{
   WeatherData result = await ApiRepository.callApiGetWeather();
    print(result);
    return result;
  }
}