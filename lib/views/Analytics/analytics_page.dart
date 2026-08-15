import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';
import 'health_report_page.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int selectedPeriodIndex = 0; // 0: Day, 1: Week, 2: Month, 3: Year
  final List<String> periods = const ["Day", "Week", "Month", "Year"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Analytics & Progress ✨",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "Track. Analyze. Achieve.",
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HealthReportPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CustomCircle(
                icon: Icons.calendar_month_outlined,
                iconColor: AppColors.textDark,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HealthReportPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CustomCircle(
                icon: Icons.tune_rounded,
                iconColor: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== 1. Time Period Selector =====
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.cardSurfaceLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: List.generate(periods.length, (index) {
                  final isSelected = index == selectedPeriodIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPeriodIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primaryColor
                                        .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          periods[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textMuted,
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w800
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // ===== 2. KPI Overview Cards (Exact Match to User Image) =====
            Row(
              children: [
                Expanded(
                  child: _buildKPIStatCard(
                    title: "Calories Burned",
                    value: "2,150 kcal",
                    change: "Target achieved today 🎉",
                    icon: Icons.local_fire_department_rounded,
                    accentColor: const Color(0xFFF43F5E),
                    cardBgColor: const Color(0xFFFFF1F2),
                    borderColor: const Color(0xFFFFE4E6),
                    sparklineData: const [5, 8, 12, 9, 14, 12, 18],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKPIStatCard(
                    title: "Avg Heart Rate",
                    value: "78 BPM",
                    change: "Normal Range",
                    icon: Icons.favorite_rounded,
                    accentColor: const Color(0xFFEF4444),
                    cardBgColor: const Color(0xFFFFF1F2),
                    borderColor: const Color(0xFFFFE4E6),
                    sparklineData: const [12, 8, 18, 10, 15, 8, 12],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildKPIStatCard(
                    title: "Sleep Duration",
                    value: "8h 12m",
                    change: "Deep sleep 3.5h",
                    icon: Icons.bedtime_rounded,
                    accentColor: const Color(0xFF8B5CF6),
                    cardBgColor: const Color(0xFFF5F3FF),
                    borderColor: const Color(0xFFDDD6FE),
                    sparklineData: const [6, 8.5, 7, 10, 8.5, 9.5, 8.2],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKPIStatCard(
                    title: "Weight Progress",
                    value: "68.5 kg",
                    change: "-2.4 kg vs target",
                    icon: Icons.monitor_weight_rounded,
                    accentColor: const Color(0xFF10B981),
                    cardBgColor: const Color(0xFFF0FDF4),
                    borderColor: const Color(0xFFBBF7D0),
                    sparklineData: const [20, 18, 16, 15, 14, 12, 10],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ===== 3. Calorie Trend Line Chart =====
            Container(
              padding: const EdgeInsets.all(18),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Calorie Trend ⓘ",
                              style: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Daily target: 2,000 kcal • ▲ 12% vs last week",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.limeColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColors.cardSurfaceLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Calories",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Steps",
                                  style: TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 10)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 190,
                    child: LineChart(
                      LineChartData(
                        maxY: 2800,
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              getTitlesWidget: (value, meta) {
                                if (value % 600 == 0) {
                                  return Text(
                                    '${(value / 1000).toStringAsFixed(1)}k',
                                    style: const TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 10,
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const hours = [
                                  '0',
                                  '8am',
                                  '10am',
                                  '12pm',
                                  '2pm',
                                  '4pm',
                                  '6pm',
                                  '8pm'
                                ];
                                final index = value.toInt();
                                if (index >= 0 && index < hours.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      hours[index],
                                      style: const TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                        ),
                        extraLinesData: ExtraLinesData(
                          horizontalLines: [
                            HorizontalLine(
                              y: 2000,
                              color: AppColors.primaryColor.withValues(alpha: 0.5),
                              strokeWidth: 1.5,
                              dashArray: [5, 5],
                              label: HorizontalLineLabel(
                                show: true,
                                alignment: Alignment.topRight,
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                                labelResolver: (line) => "Goal 2,000",
                              ),
                            ),
                          ],
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(1, 400),
                              FlSpot(2, 850),
                              FlSpot(3, 2150),
                              FlSpot(4, 1200),
                              FlSpot(5, 1800),
                              FlSpot(6, 2400),
                              FlSpot(7, 1950),
                            ],
                            isCurved: true,
                            color: AppColors.primaryColor,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor.withValues(alpha: 0.2),
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
                                radius: spot.x == 3 ? 6 : 4,
                                color: spot.x == 3
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                strokeWidth: 3,
                                strokeColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 4. Daily Activity Circular Gauges =====
            const Text(
              "Daily Activity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: const [
                Expanded(
                  child: _ActivityCircleTile(
                    title: "Active Minutes",
                    value: "68",
                    target: "/ 60 min",
                    progress: 1.0,
                    color: AppColors.limeColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _ActivityCircleTile(
                    title: "Steps",
                    value: "7,842",
                    target: "/ 8,000",
                    progress: 0.98,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _ActivityCircleTile(
                    title: "Water Intake",
                    value: "1.8",
                    target: "/ 2.5 L",
                    progress: 0.72,
                    color: AppColors.accentCyan,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ===== 5. AI Health Insight Banner Card =====
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.auto_awesome_rounded,
                          color: AppColors.primaryColor, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "AI Health Insight",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Great job! You burned 15% more calories than yesterday, but your sleep was lower. Try to sleep 30m earlier tonight.",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "View Tips",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Exact Match KPI Card Component
  Widget _buildKPIStatCard({
    required String title,
    required String value,
    required String change,
    required IconData icon,
    required Color accentColor,
    required Color cardBgColor,
    required Color borderColor,
    required List<double> sparklineData,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: accentColor, size: 18),
                    ),
                    const Icon(Icons.more_vert_rounded,
                        color: AppColors.textMuted, size: 18),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  change,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(21),
              bottomRight: Radius.circular(21),
            ),
            child: SizedBox(
              height: 36,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: const LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        sparklineData.length,
                        (i) => FlSpot(i.toDouble(), sparklineData[i]),
                      ),
                      isCurved: true,
                      color: accentColor,
                      barWidth: 1.8,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            accentColor.withValues(alpha: 0.25),
                            accentColor.withValues(alpha: 0.03),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityCircleTile extends StatelessWidget {
  final String title;
  final String value;
  final String target;
  final double progress;
  final Color color;

  const _ActivityCircleTile({
    required String title,
    required String value,
    required String target,
    required double progress,
    required Color color,
  })  : title = title,
        value = value,
        target = target,
        progress = progress,
        color = color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 54,
                width: 54,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 5,
                  backgroundColor: AppColors.cardSurfaceLight,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            target,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
