import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/map');
          },
          child: const Text('Map'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/weather');
          },
          child: const Text('Weather'),
        ),
      ],
    );
  }
}