import 'package:flutter/material.dart';
import 'package:weather/utils/weather.dart';
class WeatherScreen extends StatefulWidget {
  WeatherData weatherData;
  WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
