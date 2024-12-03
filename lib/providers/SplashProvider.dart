import 'package:flutter/material.dart';

import '../screens/Authentication/OnboardingScreen/OnboardingScreen/OnboardingScreen.dart';

class SplashScreenProvider with ChangeNotifier {
  void navigateToNextScreen(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnboardingScreen();
          },
        ),
      );
    });
  }

}
