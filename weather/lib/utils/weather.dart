import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/credentials.dart';
import 'package:weather/utils/location.dart';
class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;
  WeatherDisplayData({required this.weatherIcon, required this.weatherImage})
}
class WeatherData{
  WeatherData({required this.locationData});
  LocationHelper locationData;

  double? currentTemperature;
  var currentCondition;
  Future getCurrentTemperature() async
  {
    Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/onecall?lat=${locationData.latitude}&lon=${locationData.longitude}&exclude={part}&appid=${apiKey}"));
    if(response.statusCode==200)
      {
        String data=response.body;
        var currentWeather=jsonDecode(data);
        try {
          currentTemperature = currentWeather["current"]["temp"];
          currentCondition = currentWeather['current']['weather'][0]['id'];
        }
        catch(e)
        {
          print(e);
        }
        }
  }
  WeatherDisplayData getWeatherDisplayData(){
    if(currentCondition<600)
      {
        return WeatherDisplayData(weatherIcon: Icon(Icons.cloud), weatherImage: weatherImage);
      }
    else
    {
      DateTime time=DateTime.now();
      if(time.hour<15)
        {
          return WeatherDisplayData(weatherIcon: Icon(Icons.sunny), weatherImage: weatherImage);
        }
      else{
        return WeatherDisplayData(weatherIcon: Icon(Icons.stars), weatherImage: weatherImage);
      }

    }

  }
}