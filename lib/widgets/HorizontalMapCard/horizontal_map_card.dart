import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:flutter/material.dart';

class HorizontalMapCard extends StatelessWidget {
  const HorizontalMapCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(right: screenWidth * 0.02,left: screenWidth * 0.05, bottom: 10),
      child: CustomRoundedContainer(
        width: screenWidth * 0.7, //card width
        height: screenHeight * 0.5, //card width
        backgroundColor: AppColors.white,
        radius: 12,
        borderColor: AppColors.lighyGreyColor1,
        showBorder: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: screenWidth ,
                height: screenHeight * 0.14,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/card2.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRoundedContainer(
                      height: screenHeight * 0.025,
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),
                      backgroundColor: AppColors.fill.withOpacity(1),
                      radius: 25,
                      child: Text(
                        'Swimming',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color:
                          AppColors.secondaryColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Swimming Competition',
                      style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.body1,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.secondaryColor,
                          size: AppFontSizes.body,
                        ),
                        SizedBox(width: screenWidth * 0.010),
                        Text(
                          'Florida, USA',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.small,
                            color: AppColors.IconColors,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.030),
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.secondaryColor,
                          size: AppFontSizes.small,
                        ),
                        SizedBox(width: screenWidth * 0.010),
                        Text(
                          '25 Dec, 24',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.small,
                            color: AppColors.IconColors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$20',
                            style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor),
                          ),
                          TextSpan(
                            text: '/person',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontSize: AppFontSizes.body,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
