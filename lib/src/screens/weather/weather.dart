import 'package:flutter/material.dart';
import 'package:katai/src/common/loader/bike_loader.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  static const routeName = '/weather';

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BikeLoader(),
      ],
    );
  }
}