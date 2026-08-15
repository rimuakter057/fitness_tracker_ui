import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';
import 'meal_detail_page.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  int waterGlasses = 6;
  final int totalWaterTarget = 8;

  final List<Map<String, dynamic>> meals = const [
    {
      "type": "Breakfast",
      "name": "Avocado Toast & Poached Eggs",
      "calories": "420 kcal",
      "time": "08:30 AM",
      "icon": Icons.free_breakfast_rounded,
      "color": AppColors.limeColor,
    },
    {
      "type": "Lunch",
      "name": "Grilled Chicken & Quinoa Bowl",
      "calories": "680 kcal",
      "time": "01:15 PM",
      "icon": Icons.lunch_dining_rounded,
      "color": AppColors.primaryColor,
    },
    {
      "type": "Snack",
      "name": "Greek Yogurt & Almonds",
      "calories": "210 kcal",
      "time": "04:45 PM",
      "icon": Icons.bakery_dining_rounded,
      "color": AppColors.accentOrange,
    },
    {
      "type": "Dinner",
      "name": "Baked Salmon & Asparagus",
      "calories": "540 kcal",
      "time": "08:00 PM",
      "icon": Icons.dinner_dining_rounded,
      "color": AppColors.accentPurple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Diet & Nutrition",
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
              icon: Icons.add_rounded,
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
            // ===== 1. Calorie Progress Ring & Macro Overview Card =====
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(26),
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
                  const Text(
                    "Nutrition Summary",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 94,
                            width: 94,
                            child: CircularProgressIndicator(
                              value: 1650 / 2200,
                              strokeWidth: 8,
                              backgroundColor: AppColors.cardSurfaceLight,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1,650",
                                style: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "/ 2,200 kcal\nRemaining",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          children: [
                            _MacroBarItem(
                              label: "Carbs",
                              current: "180g",
                              target: "220g",
                              progress: 0.81,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(height: 10),
                            _MacroBarItem(
                              label: "Protein",
                              current: "110g",
                              target: "140g",
                              progress: 0.78,
                              color: AppColors.limeColor,
                            ),
                            SizedBox(height: 10),
                            _MacroBarItem(
                              label: "Fat",
                              current: "45g",
                              target: "65g",
                              progress: 0.69,
                              color: AppColors.accentOrange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ===== 2. Water Intake Hydration Tracker Card =====
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F9FF),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFBAE6FD), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: AppColors.accentCyan,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.water_drop_rounded,
                            color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hydration Goal ($waterGlasses/$totalWaterTarget Glasses)",
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "${waterGlasses * 250} ml / ${totalWaterTarget * 250} ml consumed",
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (waterGlasses < totalWaterTarget) {
                            setState(() {
                              waterGlasses++;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.accentCyan,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.add_rounded,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 2),
                              Text(
                                "+250ml",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 8 Glass Icons Strip (Matching Screen 4 Image)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(totalWaterTarget, (i) {
                      final isFilled = i < waterGlasses;
                      return Icon(
                        Icons.local_drink_rounded,
                        size: 20,
                        color: isFilled
                            ? AppColors.accentCyan
                            : const Color(0xFFCBD5E1),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 3. Meal Logs Header =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: "Today's Meals",
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
                Text(
                  "1,850 kcal Logged",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // ===== 4. Meal List =====
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = meals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailPage(
                          mealName: item["name"] as String,
                          mealType: item["type"] as String,
                          calories: item["calories"] as String,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
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
                  child: Row(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: (item["color"] as Color)
                              .withValues(alpha: 0.12),
                        ),
                        child: Icon(
                          item["icon"] as IconData,
                          color: item["color"] as Color,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item["type"] as String,
                                  style: TextStyle(
                                    color: item["color"] as Color,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "• ${item["time"]}",
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item["name"] as String,
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item["calories"] as String,
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            ),
            const SizedBox(height: 20),

            // ===== 5. Nutrient Balance Card (Matching Screen 4 Image) =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nutrient Balance",
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Good job! You're meeting most of your nutrient goals today.",
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: AppColors.cardBorder),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "View Details",
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.eco_rounded,
                      color: AppColors.limeColor, size: 48),
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

class _MacroBarItem extends StatelessWidget {
  final String label;
  final String current;
  final String target;
  final double progress;
  final Color color;

  const _MacroBarItem({
    required this.label,
    required this.current,
    required this.target,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "$current / $target",
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: AppColors.cardSurfaceLight,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
