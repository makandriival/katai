import 'package:flutter/material.dart';
import 'package:katai/src/settings/settings_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingsView.routeName);
            },
            child: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}