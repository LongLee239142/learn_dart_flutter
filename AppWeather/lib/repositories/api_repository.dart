import 'package:app_weather/apps/utils/const.dart';
import 'package:app_weather/models/weather.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather(Position? position) async {
    try {
      final dio = Dio();
      // final res = await dio.get(
      //     "https://api.openweathermap.org/data/2.5/weather?lat=20,99070&lon=105,78332&units=metric&appid=f33e152fe62a30f1f848f9d8b1b9e948");
      final res = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}");
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
     rethrow;
    }
  }
  static Future<List<WeatherDetail>> callApiGetWeatherDetail(Position? position) async {
    try {
      final dio = Dio();
      // final res = await dio.get(
      //     "https://api.openweathermap.org/data/2.5/forecast?lat=21,02838&lon=105,84616&appid=f33e152fe62a30f1f848f9d8b1b9e948");
      final res = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}");
      List data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
