import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key});

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  final List<Map<String, dynamic>> exercises = [
    {
      "title": "Jumping Jacks",
      "subtitle": "Warm up • 3 Sets x 45 Sec",
      "calories": "45 kcal",
      "icon": Icons.directions_run_rounded,
      "isDone": true,
    },
    {
      "title": "Push-Ups",
      "subtitle": "Upper Body • 4 Sets x 15 Reps",
      "calories": "110 kcal",
      "icon": Icons.fitness_center_rounded,
      "isDone": true,
    },
    {
      "title": "Dumbbell Squats",
      "subtitle": "Lower Body • 4 Sets x 12 Reps",
      "calories": "180 kcal",
      "icon": Icons.accessibility_new_rounded,
      "isDone": false,
    },
    {
      "title": "Plank Hold",
      "subtitle": "Core Focus • 3 Sets x 60 Sec",
      "calories": "75 kcal",
      "icon": Icons.timer_rounded,
      "isDone": false,
    },
    {
      "title": "Mountain Climbers",
      "subtitle": "Cardio & Core • 3 Sets x 40 Sec",
      "calories": "130 kcal",
      "icon": Icons.sports_gymnastics_rounded,
      "isDone": false,
    },
  ];

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
          "Workout Plan",
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
              icon: Icons.bookmark_border_rounded,
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
            // ===== 1. Hero Workout Banner =====
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "ADVANCED • FULL BODY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star_rounded,
                              color: Color(0xFFFDE047), size: 16),
                          SizedBox(width: 4),
                          Text(
                            "4.9 (1.2k)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "High Intensity\nFull Body Sculpt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      _HeroStatBadge(
                        icon: Icons.local_fire_department_rounded,
                        label: "540 kCal",
                      ),
                      SizedBox(width: 12),
                      _HeroStatBadge(
                        icon: Icons.timer_rounded,
                        label: "45 Mins",
                      ),
                      SizedBox(width: 12),
                      _HeroStatBadge(
                        icon: Icons.fitness_center_rounded,
                        label: "12 Exercises",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 2. Target Muscle Chips =====
            const CustomText(
              text: "Target Muscle Groups",
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
            const SizedBox(height: 12),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _MuscleChip(label: "🔥 Full Body", isSelected: true),
                  SizedBox(width: 10),
                  _MuscleChip(label: "💪 Arms & Chest", isSelected: false),
                  SizedBox(width: 10),
                  _MuscleChip(label: "🦵 Legs & Core", isSelected: false),
                  SizedBox(width: 10),
                  _MuscleChip(label: "🏃 Cardio", isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 3. Exercise List Section =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Exercise Routine",
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
                Text(
                  "${exercises.where((e) => e['isDone'] == true).length}/${exercises.length} Completed",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exercises.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = exercises[index];
                final isDone = item["isDone"] as bool;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      item["isDone"] = !isDone;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.cardSurface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDone
                            ? AppColors.limeColor.withValues(alpha: 0.5)
                            : AppColors.cardBorder,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isDone
                                ? AppColors.limeColor.withValues(alpha: 0.15)
                                : AppColors.primaryColor.withValues(alpha: 0.1),
                          ),
                          child: Icon(
                            item["icon"] as IconData,
                            color: isDone
                                ? AppColors.limeColor
                                : AppColors.primaryColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"] as String,
                                style: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  decoration: isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                item["subtitle"] as String,
                                style: const TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDone
                                ? AppColors.limeColor
                                : Colors.transparent,
                            border: Border.all(
                              color: isDone
                                  ? AppColors.limeColor
                                  : AppColors.cardBorder,
                              width: 2,
                            ),
                          ),
                          child: isDone
                              ? const Icon(Icons.check_rounded,
                                  color: Colors.white, size: 18)
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 4,
              shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Workout Session Started! 🚀"),
                  backgroundColor: AppColors.primaryColor,
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_circle_fill_rounded,
                    color: Colors.white, size: 22),
                SizedBox(width: 8),
                Text(
                  "Start Workout Session",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroStatBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroStatBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 14),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MuscleChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _MuscleChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.cardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? AppColors.primaryColor.withValues(alpha: 0.25)
                : Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textDark,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }
}
