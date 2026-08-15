import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController =
      TextEditingController(text: "Alex Morgan");
  final TextEditingController weightController =
      TextEditingController(text: "68.5");
  final TextEditingController heightController =
      TextEditingController(text: "178");
  final TextEditingController calorieController =
      TextEditingController(text: "2200");

  String selectedGoal = "Muscle Gain & Weight Loss";

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
          "Edit Profile & Goals",
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Avatar Edit Picker
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.primaryColor, width: 3),
                      gradient: AppColors.heroGradient,
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.person, color: Colors.white, size: 52),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt_rounded,
                        color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Form Fields
            _buildInputField(
              controller: nameController,
              label: "Full Name",
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    controller: weightController,
                    label: "Target Weight (kg)",
                    icon: Icons.monitor_weight_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInputField(
                    controller: heightController,
                    label: "Height (cm)",
                    icon: Icons.height_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            _buildInputField(
              controller: calorieController,
              label: "Daily Calorie Target (kcal)",
              icon: Icons.local_fire_department_outlined,
            ),
            const SizedBox(height: 20),

            // Primary Goal Selector
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Primary Fitness Goal",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedGoal,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textMuted),
                  items: const [
                    DropdownMenuItem(
                      value: "Muscle Gain & Weight Loss",
                      child: Text("Muscle Gain & Weight Loss"),
                    ),
                    DropdownMenuItem(
                      value: "Cardio & Endurance Focus",
                      child: Text("Cardio & Endurance Focus"),
                    ),
                    DropdownMenuItem(
                      value: "Flexibility & Body Maintenance",
                      child: Text("Flexibility & Body Maintenance"),
                    ),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selectedGoal = val;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Save CTA Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profile Settings Saved Successfully! ✨"),
                      backgroundColor: AppColors.primaryColor,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Profile Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.primaryColor, size: 20),
            filled: true,
            fillColor: AppColors.cardSurface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
