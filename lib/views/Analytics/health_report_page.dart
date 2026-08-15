import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';

class HealthReportPage extends StatelessWidget {
  const HealthReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomCircle(
              icon: Icons.arrow_back_ios_new_rounded,
              iconColor: AppColors.textDark,
            ),
          ),
        ),
        title: const Text(
          "Health & Medical Report",
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CustomCircle(
              icon: Icons.file_download_outlined,
              iconColor: AppColors.primaryColor,
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
            // ===== 1. Overall Health Score Card =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: AppColors.heroGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: 0.92,
                          strokeWidth: 8,
                          backgroundColor: Colors.white24,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "92",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "/100",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXCELLENT HEALTH SCORE",
                          style: TextStyle(
                            color: Color(0xFFFDE047),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Optimal Fitness Level",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Cardiovascular endurance and recovery are top 5% in your age group.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // ===== 2. Body Composition Analysis =====
            const Text(
              "Body Composition Analysis",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                _CompTile(
                  title: "Muscle Mass",
                  value: "54.2 kg",
                  status: "Optimal",
                  color: AppColors.primaryColor,
                ),
                _CompTile(
                  title: "Body Fat",
                  value: "16.5 %",
                  status: "Athletic Range",
                  color: AppColors.limeColor,
                ),
                _CompTile(
                  title: "Total Body Water",
                  value: "62.4 %",
                  status: "Well Hydrated",
                  color: AppColors.accentCyan,
                ),
                _CompTile(
                  title: "Bone Mass",
                  value: "3.2 kg",
                  status: "Normal",
                  color: AppColors.accentPurple,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ===== 3. Medical Vitals Breakdown =====
            const Text(
              "Vital Medical Metrics",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: const Column(
                children: [
                  _VitalRow(
                    label: "Blood Pressure",
                    value: "118 / 78 mmHg",
                    tag: "Normal",
                    tagColor: AppColors.limeColor,
                  ),
                  Divider(height: 1, color: AppColors.cardBorder),
                  _VitalRow(
                    label: "Resting Heart Rate",
                    value: "64 BPM",
                    tag: "Excellent",
                    tagColor: AppColors.primaryColor,
                  ),
                  Divider(height: 1, color: AppColors.cardBorder),
                  _VitalRow(
                    label: "VO2 Max Rating",
                    value: "48 ml/kg/min",
                    tag: "Superior",
                    tagColor: AppColors.accentPurple,
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
}

class _CompTile extends StatelessWidget {
  final String title;
  final String value;
  final String status;
  final Color color;

  const _CompTile({
    required this.title,
    required this.value,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
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
            status,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _VitalRow extends StatelessWidget {
  final String label;
  final String value;
  final String tag;
  final Color tagColor;

  const _VitalRow({
    required this.label,
    required this.value,
    required this.tag,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          color: AppColors.textDark,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: tagColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: tagColor,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
