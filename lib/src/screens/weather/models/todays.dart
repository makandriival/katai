import 'package:flutter/material.dart';

class TodaysWeather extends ChangeNotifier {
  String city;
  String updatedAt;
  String temperature;
  String condition;

  TodaysWeather({
    required this.city,
    required this.updatedAt,
    required this.temperature,
    required this.condition,
  });

  get getCity => city;
}
