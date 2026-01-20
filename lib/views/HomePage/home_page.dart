import 'package:fitness_tracker_ui/utils/color.dart';
import 'package:fitness_tracker_ui/views/FitnessTracker/fitness_tracker_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';
import '../Widget/custom_row.dart';
import 'Widget/custom_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CustomCircle(
          size: size,
          icon: Icons.grid_view_outlined,
        ),
        centerTitle: true,

        title: const Text("Fitness Tracker",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.whiteColor
        ),

        ),

        actions: [
          CustomCircle(
            size: size,
            icon: Icons.notification_add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Make Your",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: AppColors.whiteColor
                ),
        
              ),
              const Text("Body Perfect",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryColor
                ),
        
              ),
        
        
        
              const SizedBox(
                height: 18,
              ),
              Container(
                width: size.width,
                height: size.height * .27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
        
        
                          const Text("Full Body",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.backgroundColor
                            ),
        
                          ),
        
        
        
        
                          const Text("Exercise X3",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.backgroundColor
                            ),
        
                          ),
        
                    const SizedBox(height: 16,),
                          CustomRow(
                            size: size,
                            icon: Icons.local_fire_department_outlined,
                            text: "1230 kCal",
                          ),
                          CustomRow(
                            size: size,
                            icon: Icons.alarm,
                            text: "50 min",
                          ),
                          const SizedBox(height: 16,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.limeColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FitnessTrackerPage()));
                              },
                              child: const Text(
                                "Start Now",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                    Positioned(
                        right: 8,
                        bottom: 3,
                        top: 5,
                        child: CustomCircle(
                          size: size,
                          color: AppColors.limeColor,
                          height: size.height * .5,
                          width: size.width * .5,
                        )),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/image_one-removebg-preview.png",
                        width: size.width * .45,
                        height: size.height * .4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ///chart here


          Container(
            width: size.width,
            height: size.height * 0.32,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [AppColors.secondaryColor, AppColors.backgroundColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Weekly Progress",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Stack(
                    children: [
                      // ===== Bar Chart for Calories =====
                      BarChart(
                        BarChartData(
                          maxY: 100,
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) => Text(
                                  '${value.toInt()}',
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const days = [
                                    'Mon',
                                    'Tue',
                                    'Wed',
                                    'Thu',
                                    'Fri',
                                    'Sat',
                                    'Sun'
                                  ];
                                  return Text(
                                    days[value.toInt()],
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: 50, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: 70, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: 30, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: 80, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: 60, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: 90, width: 16, color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: 40, width: 16, color: AppColors.primaryColor)
                            ]),
                          ],
                        ),
                      ),

                      // ===== Line Chart for Steps =====
                      LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(enabled: false),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 40),
                                FlSpot(1, 60),
                                FlSpot(2, 30),
                                FlSpot(3, 80),
                                FlSpot(4, 50),
                                FlSpot(5, 90),
                                FlSpot(6, 70),
                              ],
                              isCurved: true,
                              color: Colors.white,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.4),
                                    Colors.white.withOpacity(0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) =>
                                    FlDotCirclePainter(
                                      radius: 4,
                                      color: Colors.white,
                                      strokeWidth: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),








              //=========================================
              Row(
                children: [
                  Expanded(
                    child: CustomCardItem(
                      size: size,
                      data: "Running \n Distance",
                      distance: "1.8 km",
                      fontColor: AppColors.backgroundColor,
                      backgroundColor: AppColors.primaryColor,
                      distanceColor: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomCardItem(
                      size: size,
                      data: "Total \n Cycling",
                      icon: Icons.directions_bike_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
        
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.secondaryColor,
                ),
                child: ListTile(
                  title: const Text("Appointment",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.whiteColor
                    ),
        
                  ),
        
        
        
                  subtitle: CustomText(
                    size: size,
                    text: "Far a exercise practice",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  trailing: CustomCircle(
                    size: size,
                    height: size.height * .1,
                    width: size.width * .1,
                    color: AppColors.primaryColor,
                    icon: Icons.call,
                    iconColor: AppColors.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
