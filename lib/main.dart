import 'package:brogam/providers/OnboardingProvider.dart';
import 'package:brogam/screens/Authentication/OnboardingScreen/SigninOnboardingScreen/signin_onboarding_screen.dart';
import 'package:brogam/screens/Authentication/OnboardingScreen/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/SplashProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
