import 'package:fitness_tracker_ui/views/main_navigation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessTrackerUi());
}

class FitnessTrackerUi extends StatelessWidget {
  const FitnessTrackerUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Fitness Tracker',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationPage(),
    );
  }
}
