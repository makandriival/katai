import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:katai/src/screens/weather/models/todays.dart';
import 'package:katai/src/screens/weather/models/weather_provider.dart';
import '../constants/constants.dart';
import 'package:provider/provider.dart';

Future<String> getCurrentWeather(String city, BuildContext context) async {
  final dio = Dio();
  final String url ='$weather_map_base_url/$todayEndpoint?q=$city&key=$weather_api_key';
  WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context, listen: false);

  try {
    final response = await dio.get(url);

    TodaysWeather formattedResponse = TodaysWeather(
      city: response.data['location']['name'],
      updatedAt: response.data['location']['localtime'],
      temperature: response.data['current']['temp_c'].toString(),
      condition: response.data['current']['condition']['text'],
    );
    weatherProvider.updateTodaysWeather(formattedResponse);

    if (response.statusCode == 200) {
      return '${response.statusCode}';
    } else {
      return 'not found';
    }
  } catch (error) {
    print('Error?: $error');

    TodaysWeather formattedResponse = TodaysWeather(
      city: 'not found',
      updatedAt: 'not found',
      temperature: 'not found',
      condition: 'not found',
    );
    weatherProvider.updateTodaysWeather(formattedResponse);

    return 'not found';
  }
}
