import 'package:app_weather/models/weather.dart';
import 'package:app_weather/repositories/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider extends ChangeNotifier{
  Position? position;
  String nameCity = '';

  updatePosition(Position positionCurrent){
    position = positionCurrent;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async{
   WeatherData result = await ApiRepository.callApiGetWeather(position);
   nameCity = result.name;
    return result;
  }
  Future<List<WeatherDetail>> getWeatherDetail() async{
    List<WeatherDetail> result = await ApiRepository.callApiGetWeatherDetail(position);
    return result;
  }

}