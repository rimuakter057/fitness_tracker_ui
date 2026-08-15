import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';

class ActivityTrackerPage extends StatefulWidget {
  const ActivityTrackerPage({super.key});

  @override
  State<ActivityTrackerPage> createState() => _ActivityTrackerPageState();
}

class _ActivityTrackerPageState extends State<ActivityTrackerPage> {
  int selectedActivity = 1; // Default selected: Cycling (Screen 3 in mockup)
  bool isPlayingMusic = true;

  final List<Map<String, dynamic>> activityData = const [
    {
      "name": "Running",
      "icon": Icons.directions_run_rounded,
      "distance": "5.42",
      "duration": "00:42:18",
      "pace": "5'12\" /km",
      "paceLabel": "AVG PACE",
      "calories": "420 kcal",
      "badge": "GPS Active • Speed: 12.4 km/h • Cadence: 165 spm",
      "cadence": "165",
      "cadenceUnit": "spm",
      "hr": "145",
      "elevation": "120 m",
      "signal": "99%",
      "color": AppColors.primaryColor,
    },
    {
      "name": "Cycling",
      "icon": Icons.directions_bike_rounded,
      "distance": "18.60",
      "duration": "00:54:10",
      "pace": "24.5 km/h",
      "paceLabel": "AVG SPEED",
      "calories": "680 kcal",
      "badge": "GPS Active • Speed: 24.5 km/h • Cadence: 85 rpm",
      "cadence": "85",
      "cadenceUnit": "rpm",
      "hr": "120",
      "elevation": "220 m",
      "signal": "98%",
      "color": AppColors.accentCyan,
    },
    {
      "name": "Walking",
      "icon": Icons.directions_walk_rounded,
      "distance": "3.15",
      "duration": "00:35:20",
      "pace": "11'15\" /km",
      "paceLabel": "AVG PACE",
      "calories": "175 kcal",
      "badge": "GPS Active • Speed: 4.8 km/h • Steps: 4,200",
      "cadence": "110",
      "cadenceUnit": "spm",
      "hr": "98",
      "elevation": "45 m",
      "signal": "95%",
      "color": AppColors.limeColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = activityData[selectedActivity];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Live GPS Tracker",
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CustomCircle(
              icon: Icons.settings_outlined,
              iconColor: AppColors.textDark,
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
            // ===== 1. Activity Mode Selector =====
            Row(
              children: List.generate(activityData.length, (index) {
                final isSelected = index == selectedActivity;
                final item = activityData[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedActivity = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      margin: EdgeInsets.only(
                          right: index == activityData.length - 1 ? 0 : 10),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? item["color"] as Color
                            : AppColors.cardSurface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? item["color"] as Color
                              : AppColors.cardBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? (item["color"] as Color)
                                    .withValues(alpha: 0.3)
                                : Colors.black.withValues(alpha: 0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"] as IconData,
                            size: 18,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            item["name"] as String,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.textDark,
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.w800
                                  : FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // ===== 2. Map Visual Card =====
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: const Color(0xFFE0F2FE),
                border: Border.all(color: AppColors.cardBorder, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: CustomPaint(
                        painter: _MapRoutePainter(
                          lineColor: current["color"] as Color,
                          distanceLabel: "${current["distance"]} km",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.sensors_rounded,
                              color: current["color"] as Color, size: 16),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              current["badge"] as String,
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
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

            // ===== 3. Large Live Distance Display =====
            Center(
              child: Column(
                children: [
                  Text(
                    current["distance"] as String,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                    ),
                  ),
                  Text(
                    "KILOMETERS (${(current["name"] as String).toUpperCase()})",
                    style: TextStyle(
                      color: current["color"] as Color,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ===== 4. Primary 3 Metrics Row =====
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MetricItem(
                    label: "DURATION",
                    value: current["duration"] as String,
                    icon: Icons.timer_outlined,
                  ),
                  _MetricItem(
                    label: current["paceLabel"] as String,
                    value: current["pace"] as String,
                    icon: Icons.speed_rounded,
                  ),
                  _MetricItem(
                    label: "CALORIES",
                    value: current["calories"] as String,
                    icon: Icons.local_fire_department_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ===== 5. Secondary 4-Stats Grid (Matching Screen 3 Image) =====
            Row(
              children: [
                Expanded(
                  child: _buildSubStatTile(
                    value: current["cadence"] as String,
                    label: "CADENCE (${current["cadenceUnit"]})",
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSubStatTile(
                    value: current["hr"] as String,
                    label: "BPM (Avg HR)",
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSubStatTile(
                    value: current["elevation"] as String,
                    label: "ELEVATION",
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSubStatTile(
                    value: current["signal"] as String,
                    label: "GPS SIGNAL",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ===== 6. Workout Playlist Mini Music Control =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: AppColors.heroGradient,
                    ),
                    child: const Icon(Icons.music_note_rounded,
                        color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eye of the Tiger (Remix)",
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Workout Motivation Playlist",
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isPlayingMusic
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill_rounded,
                      color: AppColors.primaryColor,
                      size: 32,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlayingMusic = !isPlayingMusic;
                      });
                    },
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

  Widget _buildSubStatTile({required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MetricItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textMuted, size: 18),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _MapRoutePainter extends CustomPainter {
  final Color lineColor;
  final String distanceLabel;

  _MapRoutePainter({required this.lineColor, required this.distanceLabel});

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = lineColor
      ..strokeWidth = 4.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.15, size.height * 0.75)
      ..cubicTo(
        size.width * 0.35,
        size.height * 0.25,
        size.width * 0.55,
        size.height * 0.85,
        size.width * 0.85,
        size.height * 0.35,
      );

    canvas.drawPath(path, paintLine);

    final paintStart = Paint()..color = const Color(0xFF3B82F6);
    canvas.drawCircle(
        Offset(size.width * 0.15, size.height * 0.75), 6, paintStart);

    final paintFinish = Paint()..color = AppColors.limeColor;
    canvas.drawCircle(
        Offset(size.width * 0.85, size.height * 0.35), 8, paintFinish);

    final textPainterStart = TextPainter(
      text: const TextSpan(
        text: "Start (0.0km)",
        style: TextStyle(
            color: AppColors.textDark,
            fontSize: 9,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterStart.layout();
    textPainterStart.paint(
        canvas, Offset(size.width * 0.10, size.height * 0.82));

    final textPainterFinish = TextPainter(
      text: TextSpan(
        text: "Finish ($distanceLabel)",
        style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 10,
            fontWeight: FontWeight.w800),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterFinish.layout();
    textPainterFinish.paint(
        canvas, Offset(size.width * 0.65, size.height * 0.22));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
