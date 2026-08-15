import 'package:fitness_tracker_ui/utils/color.dart';
import 'package:fitness_tracker_ui/views/FitnessTracker/fitness_tracker_page.dart';
import 'package:fitness_tracker_ui/views/Notification/notifications_page.dart';
import 'package:fitness_tracker_ui/views/Workout/workout_session_active_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDayIndex = 3; // Default: Thu 13
  int selectedChartTab = 0; // 0: Calories, 1: Steps

  final List<Map<String, String>> weekDays = const [
    {"day": "Mon", "date": "10"},
    {"day": "Tue", "date": "11"},
    {"day": "Wed", "date": "12"},
    {"day": "Thu", "date": "13"},
    {"day": "Fri", "date": "14"},
    {"day": "Sat", "date": "15"},
    {"day": "Sun", "date": "16"},
  ];

  final List<double> calorieValues = const [520, 750, 320, 890, 640, 950, 480];
  final List<double> stepValues = const [6.2, 4.5, 7.8, 9.5, 6.5, 8.8, 5.2];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== 1. Top Header Bar =====
              _buildHeader(size),
              const SizedBox(height: 18),

              // ===== 2. Week Date Strip =====
              _buildDateSelector(),
              const SizedBox(height: 20),

              // ===== 3. Featured Hero Workout Banner =====
              _buildHeroWorkoutBanner(context, size),
              const SizedBox(height: 22),

              // ===== 4. Activity Overview Section =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Activity Overview",
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FitnessTrackerPage(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildActivityOverviewCards(),
              const SizedBox(height: 22),

              // ===== 5. Today's Progress Checklist Section =====
              const CustomText(
                text: "Today's Progress",
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
              const SizedBox(height: 12),
              _buildTodaysProgressList(),
              const SizedBox(height: 22),

              // ===== 6. Weekly Progress Chart =====
              _buildAnalyticsChart(size),
              const SizedBox(height: 22),

              // ===== 7. AI Suggestion Banner Card =====
              _buildAISuggestionBanner(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Header Widget - Match Image Mockup
  Widget _buildHeader(Size size) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor, width: 2.5),
                gradient: AppColors.heroGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
            ),
            Container(
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                color: AppColors.limeColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Alex 👋",
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Ready to make today amazing!",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            );
          },
          child: Stack(
            children: [
              const CustomCircle(
                height: 44,
                width: 44,
                icon: Icons.notifications_none_rounded,
                iconColor: AppColors.textDark,
                color: AppColors.cardSurface,
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.accentOrange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Week Date Selector
  Widget _buildDateSelector() {
    return SizedBox(
      height: 76,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedDayIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 56,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.cardSurface,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.cardBorder,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? AppColors.primaryColor.withValues(alpha: 0.35)
                        : Colors.black.withValues(alpha: 0.03),
                    blurRadius: isSelected ? 14 : 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekDays[index]["day"]!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    weekDays[index]["date"]!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Featured Hero Workout Banner
  Widget _buildHeroWorkoutBanner(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: AppColors.heroGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 13,
                        color: Color(0xFFFDE047),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "TODAY'S FOCUS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Full Body\nWorkout Level 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.local_fire_department_rounded,
                        size: 14, color: Color(0xFFFDE047)),
                    SizedBox(width: 3),
                    Text(
                      "450 kCal",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.timer_outlined, size: 14, color: Colors.white),
                    SizedBox(width: 3),
                    Text(
                      "50 min",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryColor,
                    elevation: 6,
                    shadowColor: Colors.black.withValues(alpha: 0.15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkoutSessionActivePage(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Start Workout",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.play_arrow_rounded,
                          color: AppColors.primaryColor, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            bottom: 0,
            top: 6,
            child: IgnorePointer(
              child: Image.asset(
                "assets/images/image_one-removebg-preview.png",
                width: size.width * 0.38,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.fitness_center_rounded,
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.3),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3 Activity Arc Ring Metrics (Move, Exercise, Stand)
  Widget _buildActivityOverviewCards() {
    return Row(
      children: [
        Expanded(
          child: _buildArcMetricTile(
            title: "Move",
            value: "450",
            target: "/ 600 kcal",
            progress: 0.75,
            color: AppColors.accentOrange,
            icon: Icons.local_fire_department_rounded,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildArcMetricTile(
            title: "Exercise",
            value: "50",
            target: "/ 60 min",
            progress: 0.83,
            color: AppColors.limeColor,
            icon: Icons.directions_run_rounded,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildArcMetricTile(
            title: "Stand",
            value: "8",
            target: "/ 12 hrs",
            progress: 0.66,
            color: AppColors.accentCyan,
            icon: Icons.accessibility_new_rounded,
          ),
        ),
      ],
    );
  }

  Widget _buildArcMetricTile({
    required String title,
    required String value,
    required String target,
    required double progress,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(icon, color: color, size: 16),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                target,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: AppColors.cardSurfaceLight,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  // Today's Progress Progress List (Steps, Water, Calories, Sleep)
  Widget _buildTodaysProgressList() {
    final List<Map<String, dynamic>> items = [
      {
        "title": "Steps",
        "value": "7,842 / 8,000",
        "percent": "98%",
        "progress": 0.98,
        "color": AppColors.limeColor,
        "icon": Icons.directions_walk_rounded,
      },
      {
        "title": "Water",
        "value": "1.8 / 2.5 L",
        "percent": "72%",
        "progress": 0.72,
        "color": AppColors.accentCyan,
        "icon": Icons.water_drop_rounded,
      },
      {
        "title": "Calories",
        "value": "2,150 / 2,000 kcal",
        "percent": "107%",
        "progress": 1.0,
        "color": AppColors.accentOrange,
        "icon": Icons.local_fire_department_rounded,
      },
      {
        "title": "Sleep",
        "value": "8h 12m / 8h",
        "percent": "101%",
        "progress": 1.0,
        "color": AppColors.accentPurple,
        "icon": Icons.bedtime_rounded,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items.map((item) {
          final color = item["color"] as Color;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item["icon"] as IconData, color: color, size: 18),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 60,
                  child: Text(
                    item["title"] as String,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["value"] as String,
                            style: const TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            item["percent"] as String,
                            style: TextStyle(
                              color: color,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: item["progress"] as double,
                          minHeight: 6,
                          backgroundColor: AppColors.cardSurfaceLight,
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Weekly Progress Chart Section
  Widget _buildAnalyticsChart(Size size) {
    final bool isCalories = selectedChartTab == 0;
    final String selectedDayName = weekDays[selectedDayIndex]["day"]!;
    final String currentValue = isCalories
        ? "${calorieValues[selectedDayIndex].toInt()} kcal"
        : "${stepValues[selectedDayIndex]}k steps";

    final double maxChartY = isCalories ? 1000 : 12;

    return Container(
      width: size.width,
      height: 265,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppColors.cardSurface,
        border: Border.all(color: AppColors.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isCalories ? "Caloric Burn Trend" : "Step Count Tracking",
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "$selectedDayName Total: ",
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          currentValue,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.cardSurfaceLight,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    _buildChartTabButton("Calories", 0),
                    _buildChartTabButton("Steps", 1),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Stack(
              children: [
                BarChart(
                  BarChartData(
                    maxY: maxChartY,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => AppColors.textDark,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final valStr = isCalories
                              ? '${rod.toY.toInt()} kcal'
                              : '${rod.toY.toStringAsFixed(1)}k steps';
                          return BarTooltipItem(
                            valStr,
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 34,
                          getTitlesWidget: (value, meta) {
                            if (isCalories) {
                              if (value % 250 == 0) {
                                return Text(
                                  '${value.toInt()}',
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }
                            } else {
                              if (value % 3 == 0) {
                                return Text(
                                  '${value.toInt()}k',
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }
                            }
                            return const SizedBox();
                          },
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
                            final index = value.toInt();
                            if (index >= 0 && index < days.length) {
                              final isSelected = index == selectedDayIndex;
                              return Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.textMuted,
                                    fontWeight: isSelected
                                        ? FontWeight.w800
                                        : FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => const FlLine(
                        color: AppColors.cardBorder,
                        strokeWidth: 1,
                        dashArray: [4, 4],
                      ),
                    ),
                    barGroups: _generateBarGroups(isCalories),
                  ),
                ),
                LineChart(
                  LineChartData(
                    lineTouchData: const LineTouchData(enabled: false),
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: isCalories
                            ? const [
                                FlSpot(0, 520),
                                FlSpot(1, 750),
                                FlSpot(2, 320),
                                FlSpot(3, 890),
                                FlSpot(4, 640),
                                FlSpot(5, 950),
                                FlSpot(6, 480),
                              ]
                            : const [
                                FlSpot(0, 6.2),
                                FlSpot(1, 4.5),
                                FlSpot(2, 7.8),
                                FlSpot(3, 9.5),
                                FlSpot(4, 6.5),
                                FlSpot(5, 8.8),
                                FlSpot(6, 5.2),
                              ],
                        isCurved: true,
                        color: AppColors.primaryColor,
                        barWidth: 2.5,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryColor.withValues(alpha: 0.15),
                              AppColors.primaryColor.withValues(alpha: 0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4.5,
                            color: index == selectedDayIndex
                                ? AppColors.limeColor
                                : AppColors.primaryColor,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
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
    );
  }

  Widget _buildChartTabButton(String label, int index) {
    final isSelected = selectedChartTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChartTab = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textMuted,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups(bool isCalories) {
    final List<double> values = isCalories ? calorieValues : stepValues;

    return List.generate(values.length, (i) {
      final isSelected = i == selectedDayIndex;
      return BarChartGroupData(
        x: i,
        showingTooltipIndicators: isSelected ? [0] : [],
        barRods: [
          BarChartRodData(
            toY: values[i],
            width: 14,
            borderRadius: BorderRadius.circular(6),
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.cardSurfaceLight,
          ),
        ],
      );
    });
  }

  // AI Suggestion Banner (Matching Image Mockup)
  Widget _buildAISuggestionBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEEF2FF), Color(0xFFE0E7FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFC7D2FE), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.auto_awesome_rounded,
                        color: AppColors.primaryColor, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      "AI Suggestion",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accentOrange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "NEW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Try a 10-min stretching exercise to improve your muscle recovery.",
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Start Now ▶",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.self_improvement_rounded,
              color: AppColors.primaryColor, size: 48),
        ],
      ),
    );
  }
}
