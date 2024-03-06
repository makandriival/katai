import 'package:flutter/material.dart';
import 'package:katai/src/screens/weather/models/forecastday.dart';
import 'package:katai/src/screens/weather/models/todays.dart';

class WeatherProvider extends ChangeNotifier {
  TodaysWeather todaysWeather = TodaysWeather(
    city: 'City',
    updatedAt: 'Time',
    temperature: 'Temperature',
    condition: 'Condition',
  );

  updateTodaysWeather(TodaysWeather newTodaysWeather) {
    todaysWeather = newTodaysWeather;
    notifyListeners();
  }

  WeatherForecast weatherForecast = WeatherForecast();
}
