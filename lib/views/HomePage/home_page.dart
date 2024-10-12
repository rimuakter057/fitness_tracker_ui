import 'package:fitness_tracker_ui/utils/color.dart';
import 'package:fitness_tracker_ui/views/FitnessTracker/fitness_tracker_page.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style.dart';
import '../Widget/custom_circle.dart';
import '../Widget/custom_row.dart';
import 'Widget/custom_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CustomCircle(
          size: size,
          icon: Icons.grid_view_outlined,
        ),
        centerTitle: true,
        title: CustomText(size: size, text: 'Fitness Tracker'),
        actions: [
          CustomCircle(
            size: size,
            icon: Icons.notification_add_outlined,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              size: size,
              text: 'Make Your',
              fontSize: size.height * .055,
            ),
            CustomText(
              size: size,
              text: 'Body Perfect',
              color: AppColors.primaryColor,
              fontSize: size.height * .04,
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: size.width,
              height: size.height * .27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: size,
                          text: "Full Body",
                          color: AppColors.backgroundColor,
                        ),
                        CustomText(
                          size: size,
                          text: "Exercise X3",
                          color: AppColors.backgroundColor,
                        ),
                        CustomRow(
                          size: size,
                          icon: Icons.local_fire_department_outlined,
                          text: "1230 kCal",
                        ),
                        CustomRow(
                          size: size,
                          icon: Icons.alarm,
                          text: "50 min",
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.limeColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FitnessTrackerPage()));
                            },
                            child: const Text(
                              "Start Now",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                      right: 8,
                      bottom: 3,
                      top: 5,
                      child: CustomCircle(
                        size: size,
                        color: AppColors.limeColor,
                        height: size.height * .5,
                        width: size.width * .5,
                      )),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/image_one-removebg-preview.png",
                      width: size.width * .45,
                      height: size.height * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomCardItem(
                    size: size,
                    data: "Running \n Distance",
                    distance: "1.8 km",
                    fontColor: AppColors.backgroundColor,
                    backgroundColor: AppColors.primaryColor,
                    distanceColor: AppColors.backgroundColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomCardItem(
                    size: size,
                    data: "Total \n Cycling",
                    icon: Icons.directions_bike_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              /*width: size.width,
              height: size.height * .27,*/
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.secondaryColor,
              ),
              child: ListTile(
                title: CustomText(
                  size: size,
                  text: "Appointment",
                ),
                subtitle: CustomText(
                  size: size,
                  text: "Far a exercise practice",
                  fontSize: size.height * .015,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                ),
                trailing: CustomCircle(
                  size: size,
                  height: size.height * .1,
                  width: size.width * .1,
                  color: AppColors.primaryColor,
                  icon: Icons.call,
                  iconColor: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
