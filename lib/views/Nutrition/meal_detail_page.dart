import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';

class MealDetailPage extends StatelessWidget {
  final String mealName;
  final String mealType;
  final String calories;

  const MealDetailPage({
    super.key,
    this.mealName = "Avocado Toast & Poached Eggs",
    this.mealType = "Breakfast",
    this.calories = "420 kcal",
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> ingredients = const [
      {"name": "Ripe Avocado", "amount": "1 Whole"},
      {"name": "Poached Eggs", "amount": "2 Large"},
      {"name": "Whole Wheat Sourdough", "amount": "2 Slices"},
      {"name": "Extra Virgin Olive Oil", "amount": "1 tsp"},
      {"name": "Chili Flakes & Sea Salt", "amount": "Pinch"},
    ];

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
          "Recipe & Nutrition",
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
              icon: Icons.favorite_border_rounded,
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
            // ===== 1. Hero Meal Visual Card =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF059669)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.limeColor.withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      mealType.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    mealName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department_rounded,
                          color: Color(0xFFFDE047), size: 16),
                      const SizedBox(width: 4),
                      Text(
                        calories,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Icon(Icons.timer_rounded,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        "15 Mins Prep",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // ===== 2. Macros Breakdown Row =====
            const Text(
              "Macronutrient Breakdown",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: _MacroPillTile(
                    label: "Carbs",
                    value: "35g",
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _MacroPillTile(
                    label: "Protein",
                    value: "24g",
                    color: AppColors.limeColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _MacroPillTile(
                    label: "Fats",
                    value: "18g",
                    color: AppColors.accentOrange,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _MacroPillTile(
                    label: "Fiber",
                    value: "8g",
                    color: AppColors.accentCyan,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ===== 3. Ingredients Checklist =====
            const Text(
              "Ingredients Required",
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
              child: Column(
                children: List.generate(ingredients.length, (index) {
                  final item = ingredients[index];
                  return Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: const Icon(Icons.check_circle_rounded,
                            color: AppColors.limeColor, size: 20),
                        title: Text(
                          item["name"]!,
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: Text(
                          item["amount"]!,
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (index < ingredients.length - 1)
                        const Divider(height: 1, color: AppColors.cardBorder),
                    ],
                  );
                }),
              ),
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
              backgroundColor: AppColors.limeColor,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 4,
              shadowColor: AppColors.limeColor.withValues(alpha: 0.4),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Meal Logged to Today's Diet! 🥗"),
                  backgroundColor: AppColors.limeColor,
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_task_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Log Meal to Today's Diet",
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

class _MacroPillTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroPillTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
