import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/text_style.dart';
import '../../Widget/custom_circle.dart';

class CustomCardItem extends StatelessWidget {
  final String? data;
  final String? distance;
  final String? subtitle;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? distanceColor;
  final Color? iconBgColor;
  final Color? iconColor;
  final double? progressValue; // 0.0 to 1.0
  final Size? size;

  const CustomCardItem({
    super.key,
    this.size,
    this.data,
    this.icon,
    this.distance,
    this.subtitle,
    this.backgroundColor,
    this.fontColor,
    this.distanceColor,
    this.iconBgColor,
    this.iconColor,
    this.progressValue = 0.72,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor ?? AppColors.cardSurface,
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: (iconColor ?? AppColors.primaryColor).withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircle(
                icon: icon ?? Icons.directions_run,
                color: iconBgColor ?? AppColors.primaryColor.withValues(alpha: 0.12),
                iconColor: iconColor ?? AppColors.primaryColor,
                height: 40,
                width: 40,
                iconSize: 20,
              ),
              if (subtitle != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppColors.primaryColor)
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    subtitle!,
                    style: TextStyle(
                      color: iconColor ?? AppColors.primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          CustomText(
            text: data ?? "",
            color: fontColor ?? AppColors.textMuted,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          const SizedBox(height: 4),
          CustomText(
            text: distance ?? "0",
            color: distanceColor ?? AppColors.textDark,
            fontWeight: FontWeight.w900,
            fontSize: 21,
          ),
          const SizedBox(height: 10),

          // Mini Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progressValue ?? 0.72,
              minHeight: 5,
              backgroundColor: AppColors.cardSurfaceLight,
              valueColor: AlwaysStoppedAnimation<Color>(
                iconColor ?? AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}