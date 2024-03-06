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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, '/home');
              return;
            case 1:
              Navigator.pushNamed(context, '/map');
              return;
            case 2:
              Navigator.pushNamed(context, '/weather');
              return;
            case 3:
              Navigator.pushNamed(context, '/settings');
              return;
            default:
              Navigator.pushNamed(context, '/home');
          }
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.map)),
            icon: Badge(child: Icon(Icons.map_outlined)),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Badge(
              // label: Text('2'),
              child: Icon(Icons.cloud),
            ),
            label: 'Weather',
          ),
          NavigationDestination(
            icon: Badge(
              // label: Text('2'),
              child: Icon(Icons.settings),
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: const Column(
        children: [
          Text('Home'),
        ],
      ),
    );
  }
}