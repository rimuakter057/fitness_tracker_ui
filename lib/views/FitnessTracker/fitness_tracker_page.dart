import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';
import 'Widget/custom_column.dart';
import 'Widget/custom_list_tile.dart';
import 'Widget/custom_tracker_chart.dart';

class FitnessTrackerPage extends StatelessWidget {
  const FitnessTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
        centerTitle: true,
        title: const CustomText(text: 'Health Overview', color: AppColors.textDark),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CustomCircle(
              icon: Icons.notifications_none_rounded,
              iconColor: AppColors.textDark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health',
              style: TextStyle(
                fontSize: size.height * .04,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            Text(
              'Overview & Metrics',
              style: TextStyle(
                fontSize: size.height * .035,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 18),

            // Metrics Grid
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomListTile(
                        size: size,
                        title: 'Calories',
                        subTitle: '1300 kCal',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomListTile(
                        size: size,
                        title: 'Protein',
                        subTitle: '30 gram',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomListTile(
                        size: size,
                        title: 'Sleep',
                        subTitle: '8 hours',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomListTile(
                        size: size,
                        title: 'Weight',
                        subTitle: '59 kg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),

            // R-R Interval Card
            Container(
              padding: const EdgeInsets.all(16),
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: AppColors.heroGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CustomCircle(
                      color: Colors.white,
                      icon: Icons.favorite_rounded,
                      height: 48,
                      width: 48,
                      iconSize: 24,
                      iconColor: AppColors.primaryColor,
                    ),
                    title: const Text(
                      "851 ms",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      "R-R Heart Interval",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomColumn(
                          size: size,
                          text: '500 ms',
                          textColor: Colors.white,
                          isField: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomColumn(
                          size: size,
                          text: "646 ms",
                          textColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomColumn(
                          size: size,
                          text: "545 ms",
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Blood Pressure Chart Container
            Container(
              padding: const EdgeInsets.all(16),
              width: size.width,
              height: size.height * .32,
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
                  const CustomText(
                    text: "Blood Pressure Monitoring",
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                  const SizedBox(height: 12),
                  Expanded(child: CustomTrackerChart(size: size)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
