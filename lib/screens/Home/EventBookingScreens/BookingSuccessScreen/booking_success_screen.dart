import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';

class BookingSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/success.png", height: screenHeight * 0.2),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Booking Success!",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/facebook.png", height: screenHeight * 0.06),
                        Image.asset("assets/images/linkedin.png", height: screenHeight * 0.06),
                        Image.asset("assets/images/instagram.png", height: screenHeight * 0.06),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color : AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow("Event Name", "Swimming Competition"),
                      _buildDetailRow("Event Category", "Swimming"),
                      _buildDetailRow("Event Date & Time", "Dec 15 - 10:00 pm"),
                      _buildDetailRow("Payment Time", "25-02-2023, 13:22:16"),
                      _buildDetailRow("Full Name", "Sofia Anderson"),
                      _buildDetailRow("Phone Number", "+1 (208) 555-0112"),
                      _buildDetailRow("Email", "sofia@email.com"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.white,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/bar_code.png",
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                      Text("124345465366756"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ActionButton(
                text: "Go To Bookings",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColor,
                onPressed: () {},
                borderRadius: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
