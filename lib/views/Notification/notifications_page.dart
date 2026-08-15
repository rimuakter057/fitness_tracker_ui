import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../Widget/custom_circle.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedCategory = 0;
  final List<String> categories = const ["All", "Workouts", "Diet", "Badges"];

  final List<Map<String, dynamic>> notifications = const [
    {
      "title": "14-Day Streak Milestone! 🔥",
      "body":
          "Awesome consistency! You've logged 14 consecutive active workout days.",
      "time": "10m ago",
      "icon": Icons.local_fire_department_rounded,
      "color": AppColors.accentOrange,
      "isUnread": true,
    },
    {
      "title": "Evening Full Body Workout 🏋️",
      "body":
          "Your scheduled trainer session 'Full Body Sculpt' starts in 30 mins.",
      "time": "1h ago",
      "icon": Icons.fitness_center_rounded,
      "color": AppColors.primaryColor,
      "isUnread": true,
    },
    {
      "title": "Hydration Target Reached 💧",
      "body": "Great job! You logged 6/8 glasses (1,500ml) of water today.",
      "time": "3h ago",
      "icon": Icons.water_drop_rounded,
      "color": AppColors.accentCyan,
      "isUnread": false,
    },
    {
      "title": "New Achievement Unlocked 🏆",
      "body": "Congratulations! You unlocked the '50km Runner' Gold Badge.",
      "time": "1d ago",
      "icon": Icons.emoji_events_rounded,
      "color": AppColors.limeColor,
      "isUnread": false,
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
          "Notifications Center",
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
              icon: Icons.done_all_rounded,
              iconColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Filter Pills
            Row(
              children: List.generate(categories.length, (index) {
                final isSelected = index == selectedCategory;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      margin: EdgeInsets.only(
                          right: index == categories.length - 1 ? 0 : 8),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.cardSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.cardBorder,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textDark,
                          fontSize: 11,
                          fontWeight:
                              isSelected ? FontWeight.w800 : FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 18),

            // Notification List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = notifications[index];
                final color = item["color"] as Color;
                final isUnread = item["isUnread"] as bool;

                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isUnread
                        ? color.withValues(alpha: 0.05)
                        : AppColors.cardSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isUnread
                          ? color.withValues(alpha: 0.3)
                          : AppColors.cardBorder,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color.withValues(alpha: 0.15),
                        ),
                        child: Icon(item["icon"] as IconData,
                            color: color, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item["title"] as String,
                                    style: const TextStyle(
                                      color: AppColors.textDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Text(
                                  item["time"] as String,
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["body"] as String,
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 12,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
