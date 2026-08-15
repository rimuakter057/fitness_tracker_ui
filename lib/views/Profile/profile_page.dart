import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;

  final List<Map<String, dynamic>> badges = const [
    {"name": "50km Runner", "icon": Icons.directions_run_rounded, "color": AppColors.primaryColor},
    {"name": "Streak Master", "icon": Icons.local_fire_department_rounded, "color": AppColors.accentOrange},
    {"name": "Early Bird", "icon": Icons.wb_sunny_rounded, "color": AppColors.limeColor},
    {"name": "Iron Lifting", "icon": Icons.fitness_center_rounded, "color": AppColors.accentPurple},
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
          "My Profile",
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CustomCircle(
                icon: Icons.settings_outlined,
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
          children: [
            // ===== 1. User Profile Header Card =====
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
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 84,
                        width: 84,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 3),
                          gradient: AppColors.heroGradient,
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.person,
                              color: Colors.white, size: 48),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.limeColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check_rounded,
                            color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Alex Morgan",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Pro Athlete • Member since 2024",
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Streak & Goal Pills Row (Matching Screen 5 Image)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.accentOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.local_fire_department_rounded,
                                color: AppColors.accentOrange, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "14 Days Streak",
                              style: TextStyle(
                                color: AppColors.accentOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.emoji_events_rounded,
                                color: AppColors.primaryColor, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "Gold Badge",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
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

            // ===== 2. Achievement Badges Grid =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: "Achievement Badges",
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
                Text(
                  "4 Unlocked",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: badges.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.85,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = badges[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardSurface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.cardBorder, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (item["color"] as Color)
                              .withValues(alpha: 0.12),
                        ),
                        child: Icon(
                          item["icon"] as IconData,
                          color: item["color"] as Color,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["name"] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // ===== 3. Settings Menu List (Matching Screen 5 Image) =====
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Column(
                children: [
                  _buildSettingTile(
                    icon: Icons.watch_rounded,
                    title: "Connected Devices",
                    subtitle: "Apple Watch Connected",
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 14, color: AppColors.textMuted),
                  ),
                  const Divider(height: 1, color: AppColors.cardBorder),
                  _buildSettingTile(
                    icon: Icons.notifications_none_rounded,
                    title: "Push Notifications",
                    subtitle: "Daily Workout Reminders",
                    trailing: Switch(
                      value: notificationsEnabled,
                      activeTrackColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          notificationsEnabled = val;
                        });
                      },
                    ),
                  ),
                  const Divider(height: 1, color: AppColors.cardBorder),
                  _buildSettingTile(
                    icon: Icons.lock_outline_rounded,
                    title: "Privacy & Security",
                    subtitle: "Account Data & Permissions",
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 14, color: AppColors.textMuted),
                  ),
                  const Divider(height: 1, color: AppColors.cardBorder),
                  _buildSettingTile(
                    icon: Icons.help_outline_rounded,
                    title: "Help & Support",
                    subtitle: "Get Help and Contact Us",
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 14, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 4. Full Width Purple Log Out Button =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primaryColor.withValues(alpha: 0.35),
                ),
                onPressed: () {},
                child: const Text(
                  "Log Out",
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

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.cardSurfaceLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.textDark, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textDark,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 11,
        ),
      ),
      trailing: trailing,
    );
  }
}
