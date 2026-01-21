
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
        leading: CustomCircle(

          icon: Icons.arrow_back_ios,
        ),
        centerTitle: true,
        title: CustomText(size: size, text: 'Fitness Tracker'),
        actions: [
          CustomCircle(

            icon: Icons.notification_add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                size: size,
                text: 'Health',
                fontSize: size.height * .055,
              ),
              CustomText(
                size: size,
                text: 'Overview',
                color: AppColors.primaryColor,
                fontSize: size.height * .05,
              ),
              const SizedBox(
                height: 18,
              ),
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
                      Expanded(
                        child: CustomListTile(
                          size: size,
                          title: 'Protein',
                          subTitle: '30 gram',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomListTile(
                          size: size,
                          title: 'Sleep',
                          subTitle: '3 hours',
                        ),
                      ),
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
              Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                height: size.height * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: CustomCircle(

                        color: AppColors.limeColor,
                        icon: Icons.favorite_border,
                        height: size.height * .15,
                        width: size.width * .15,
                        iconSize: 35,
                      ),
                      title: CustomText(
                        size: size,
                        text: "851 ms",
                        color: Colors.black,
                      ),
                      subtitle: CustomText(
                        size: size,
                        text: "R-R interval",
                        fontWeight: FontWeight.w300,
                        color: AppColors.blackOpacityColor,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomColumn(
                            size: size,
                            text: '500 ms',
                            textColor: AppColors.backgroundColor,
                            isField: true,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomColumn(
                            size: size,
                            text: "646 ms",
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomColumn(
                            size: size,
                            text: "545 ms",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                height: size.height*.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primaryColor,width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CustomText(size: size, text:"Blood Pressure"),
                    const SizedBox(height: 10,),
                    CustomTrackerChart(size: size),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}


