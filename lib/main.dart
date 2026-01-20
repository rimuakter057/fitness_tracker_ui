
import 'package:fitness_tracker_ui/views/FitnessTracker/fitness_tracker_page.dart';
import 'package:fitness_tracker_ui/views/HomePage/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessTrackerUi());
}

class FitnessTrackerUi extends StatelessWidget {
  const FitnessTrackerUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage (),
    );
  }
}

