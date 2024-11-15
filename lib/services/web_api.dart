import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

abstract interface class WebApi {
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  });
}

class FccApi implements WebApi {
  @override
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=$latitude&lon=$longitude');
    final result = await get(url);
    final jsonString = result.body;
    final jsonMap = jsonDecode(jsonString);
    final temperature = jsonMap['main']['temp'] as double;
    final weather = jsonMap['weather'][0]['main'] as String;

    return Weather(
      description: weather,
      temperature: temperature.toInt(),
    );
  }
}
