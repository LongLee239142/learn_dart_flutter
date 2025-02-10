import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Weather {
  int id;
  String main;
  String description;

  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }
}

class Main {
  num temp;
  num feels_like;
  num temp_min;
  num temp_max;
  num humidity;

  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feels_like: map['feels_like'] as num,
      temp_min: map['temp_min'] as num,
      temp_max: map['temp_max'] as num,
      humidity: map['humidity'] as num,
    );
  }
}

class Wind {
  num speed;
  num deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as num,
      deg: map['deg'] as num,
    );
  }
}

class WeatherData {
  int id;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  String name;
  int cod;

  WeatherData({
    required this.id,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.cod,
    required this.name
  });

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      weather: weatherListFromJson(map['weather'] as List),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      cod: map['cod'] as int,
      name: map['name'] as String,
    );
  }
}

List<Weather> weatherListFromJson(List<dynamic> list) {
  return list.map((item) => Weather.fromMap(item as Map<String, dynamic>)).toList();
}

class WeatherDetail {
  Main main;
  Weather weather;
  Wind wind;
  String dt_txt;

//<editor-fold desc="Data Methods">
  WeatherDetail({
    required this.main,
    required this.weather,
    required this.wind,
    required this.dt_txt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherDetail &&
          runtimeType == other.runtimeType &&
          main == other.main &&
          weather == other.weather &&
          wind == other.wind &&
          dt_txt == other.dt_txt);

  @override
  int get hashCode =>
      main.hashCode ^ weather.hashCode ^ wind.hashCode ^ dt_txt.hashCode;

  @override
  String toString() {
    return 'WeatherDetail{' +
        ' main: $main,' +
        ' weather: $weather,' +
        ' wind: $wind,' +
        ' dt_txt: $dt_txt,' +
        '}';
  }

  WeatherDetail copyWith({
    Main? main,
    Weather? weather,
    Wind? wind,
    String? dt_txt,
  }) {
    return WeatherDetail(
      main: main ?? this.main,
      weather: weather ?? this.weather,
      wind: wind ?? this.wind,
      dt_txt: dt_txt ?? this.dt_txt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'main': this.main,
      'weather': this.weather,
      'wind': this.wind,
      'dt_txt': this.dt_txt,
    };
  }

  factory WeatherDetail.fromMap(Map<String, dynamic> map) {
    return WeatherDetail(
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      weather: Weather.fromMap((map['weather'] as List).first as Map<String, dynamic>),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }


//</editor-fold>
}
