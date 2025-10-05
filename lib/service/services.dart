import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices{
  fetchWeatherByCity(String cityName)async {
    const apiKey = "8cdb4e6acfddb887bcaa5f52f0525ca0";
    final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";
    final response = await http.get(Uri.parse(url));
    try{
      if(response.statusCode == 200){
        var data = response.body;
        var json = jsonDecode(data);
        return WeatherData.fromJson(json);
      }else{
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}