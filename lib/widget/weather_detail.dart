import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDetail extends StatelessWidget{
  final WeatherData weather;
  final String formattedDate;
  final String formattedTime;

  const WeatherDetail({super.key, required this.weather, required this.formattedDate, required this.formattedTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weather.cityname, style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        Text("${weather.temperature.current.toStringAsFixed(2)}°C", style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),),
        Text(weather.weather[0].main, style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
        const SizedBox(height: 30,),
        Text(formattedDate, style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        Text(formattedTime, style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 30,),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/cloudy.png"))
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.wind_power, color: Colors.white,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Wind", value: "${weather.wind.speed}km/h",)
                      ],
                    ),
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.sunny, color: Colors.white,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Max", value: "${weather.maxTemperature.toStringAsFixed(2)}°C",)
                      ],
                    ),
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.wind_power, color: Colors.white,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Min", value: "${weather.minTemperature.toStringAsFixed(2)}°C",)
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.water_drop, color: Colors.amber,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Humidity", value: "${weather.humidity}%",)
                      ],
                    ),
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  
                        Icon(Icons.air, color: Colors.amber,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Pressure", value: "${weather.pressure} hPa",)
                      ],
                    ),
                    Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.leaderboard, color: Colors.amber,),
                        SizedBox(height: 5,),
                        WeatherInfoCard(title: "Sea-Level", value: "${weather.seaLevel.toStringAsFixed(2)}m",)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          ),
        )
      ],
    );
  }
}

class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const WeatherInfoCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Text(value, style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
        Text(title, style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
      ],
    );
  }
}