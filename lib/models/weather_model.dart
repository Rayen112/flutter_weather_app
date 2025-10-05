
class WeatherData{
  final String cityname;
  final Temperature temperature;
  final int humidity;
  final double maxTemperature;
  final double minTemperature;
  final List<WeatherInfo> weather;
  final String description;
  final Wind wind;
  final int pressure;
  final int seaLevel;

  WeatherData({
    required this.cityname,
    required this.temperature,
    required this.humidity,
    required this.maxTemperature,
    required this.minTemperature,
    required this.wind,
    required this.weather,
    required this.description,
    required this.pressure,
    required this.seaLevel
  });

  factory WeatherData.fromJson(Map<String, dynamic> json){
    return WeatherData(
      cityname: json['name'],
      temperature: Temperature.fromJson(json['main']['temp']),
      humidity: json['main']['humidity'],
      maxTemperature: (json['main']['temp_max']-273.15), 
      minTemperature: (json['main']['temp_min'] - 273.15), 
      wind: Wind.fromJson(json['wind']),
      weather: List<WeatherInfo>.from(json['weather'].map((weather) =>WeatherInfo.fromJson(weather))),
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
      seaLevel: json['main']['sea_level']??0
    );
  }
}

class WeatherInfo{
  final String main;
  WeatherInfo({required this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    return WeatherInfo(main: json['main']);
  }
}

class Temperature{
  final double current;
  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json){
    return Temperature(current: (json -273.15));
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}
