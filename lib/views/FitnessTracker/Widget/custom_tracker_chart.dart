import 'package:fitness_tracker_ui/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class CustomTrackerChart extends StatelessWidget {
  const CustomTrackerChart({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    List <Map> data = [
      {
        "value" : 80.0,
        "index" : 0,
      },
      {
        "value" : 50.0,
        "index" : 1,
      },
      {
        "value" : 90.0,
        "index" : 2,
      },
      {
        "value" : 70.0,
        "index" : 3,
      },
      {
        "value" : 50.0,
        "index" : 4,
      },
      {
        "value" : 85.0,
        "index" : 5,
      },
    ];
    return SizedBox(
        height: size.height*.2,
        child: BarChart(
            BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: const FlTitlesData(
            show: false,
          ),
          barGroups:data.map((element)=>BarChartGroupData(x: element ['index'] + 1,
          barRods:[
            BarChartRodData(
                toY:element ['value'],
            color: AppColors.primaryColor,
              width: size.width*.07,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                color: AppColors.secondaryColor,
                toY: 100,
              )
            )
          ]
          )).toList(),
        )));
  }
}