import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<WeatherModel> _weathers = []; 
  void _getWeatherData() async {
    _weathers = await WeatherService().getWeatherData();
    setState(() {});
  }

  @override
  void initState() {
    _getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _weathers.length,
        itemBuilder: (context, index) {
          final WeatherModel weather = _weathers[index];
          return Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.blueGrey.shade50, 
            borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Image.network(weather.icon, width: 100,),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Text(
                    "${weather.day}\n ${weather.description.toUpperCase()} ${weather.degree}°",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black87
                      ),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text ("Min: ${weather.min}°"),
                        Text ("Max: ${weather.max}°"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text ("Night: ${weather.night}°"),
                        Text ("Humidity: ${weather.humidity}%"),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        }
      )
    );
  }
}