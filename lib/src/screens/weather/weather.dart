import 'package:flutter/material.dart';
import 'package:katai/src/screens/weather/models/weather_provider.dart';
import 'package:katai/src/screens/weather/services/current_wether_service.dart';
import 'package:katai/src/screens/weather/widgets/info_box.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  static const routeName = '/weather';

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
    Future<void> getWeather() async {
    await getCurrentWeather('london', context);
  }

  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Column(
        children: <Widget>[
          Consumer(builder: (context, WeatherProvider weatherProvider, child) {
            return InfoBox(todaysWeather: weatherProvider.todaysWeather);
          }),
        ],
      ),
    );
  }
}