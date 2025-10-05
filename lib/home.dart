import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/services.dart';
import 'package:weather_app/widget/weather_detail.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController = TextEditingController();
  WeatherData? weatherInfo;
  bool isLoading = false;
  String formattedDate = DateFormat("EEEE D, MMMM yyyy").format(DateTime.now());
  String formattedTime = DateFormat("hh:mm a").format(DateTime.now());

  myWeather(String city) async{
    
    setState(() {
      isLoading = true;
    });
    try{
      final weather = await WeatherServices().fetchWeatherByCity(city).timeout(Duration(seconds: 5)); 
      setState(() {
        weatherInfo = weather;
        isLoading = false;
      });
    } on TimeoutException{
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Request timed out. Please try again.")));
    }catch(erro){
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("City not found or invalid name.")));
    }
  }

  @override
  void initState(){
    super.initState(); 
    myWeather("Tunis");
     
  }
  @override
  Widget build(BuildContext context){
    return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()
                    ),
                    onSubmitted: (value){
                      if(value.isNotEmpty){
                        myWeather(value.trim());
                      }
                    },
                  ),

                  SizedBox(height: 20,),
                  
                  isLoading? const CircularProgressIndicator(color: Colors.white,)
                  : weatherInfo==null? const Text('Enter a city name to get weather info', style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),)
                  : WeatherDetail(weather: weatherInfo!, formattedDate: formattedDate, formattedTime: formattedTime),
                ],
              )
            ),
          ),
        );
  }
}