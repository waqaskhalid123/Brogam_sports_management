import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/material.dart';

import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import '../EventScreen/EventScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.075,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontSize: AppFontSizes.small,
                              color: AppColors.IconColors),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.black,
                              size: AppFontSizes.body,
                            ),
                            SizedBox(width: screenWidth * 0.010),
                            const Text(
                              'New York, USA',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.010),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.black,
                              size: AppFontSizes.title1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 5, right: 30),
                        child: CustomRoundedContainer(
                          padding: EdgeInsets.all(8),
                          showBorder: true,
                          borderColor: AppColors.primaryColor,
                          radius: 100,
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.primaryColor,
                            size: AppFontSizes.title1,
                          ),
                        )),
                  ],
                ),
              ),

              // Search Field
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: CustomField(
                  controller: TextEditingController(),
                  hintText: 'Search Sports Events',
                  hintTextColor: AppColors.IconColors,
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.textFiledColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(25),
                  borderColor: AppColors.lighyGreyColor1,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: AppColors.primaryColor,
                  ),
                  height: screenHeight * 0.06,
                ),
              ),

              // Categories
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                  height: screenHeight * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomRoundedContainer(
                          showBorder: true,
                          backgroundColor: index == 0  ? AppColors.primaryColor :AppColors.white,
                          radius: 12,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              'Swimming',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.body,
                                color: index == 0  ? AppColors.white  : AppColors.black
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Events Header: Featured
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Row(
                          children: [
                            Text(
                              'Featured',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.subtitle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventDetailScreen(),
                                    ));
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HorizontalEventCard(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child: Row(
                          children: [
                           const Text(
                              'Upcoming Events',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.subtitle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => EventScreen()));
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalEventCard(length: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
