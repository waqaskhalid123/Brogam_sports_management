import 'package:brogam/screens/Authentication/SignUpScreen/signup_screen.dart';
import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CustomToggle/custom_toggle.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../ForgotPasswordScreen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: screenHeight * 0.15,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  CustomToggle(
                    initialSelectedIndex: 0,
                    onTap: (int selectedIndex) {
                      print("Selected index: $selectedIndex");
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: const  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                    },
                    prefixIcon: const Icon(Icons.email),
                    controller: _emailController,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                    },
                    prefixIcon: Icon(Icons.lock),
                    controller: _passwordController,
                    hintText: 'password',
                    keyboardType: TextInputType.text,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        false
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Aligns the row to the right
                    children: [
                      Checkbox(
                        value: _isChecked, // Assuming _isChecked is a boolean variable for checkbox state
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 20), // Add some space between the text and the "Forgot Password" button
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  ActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    borderColor: AppColors.primaryColor,
                    text: "Sign In",
                    textColor: AppColors.white,
                    borderRadius: 25,
                    buttonWidth: double.infinity,
                  ),
                  SizedBox(height: screenHeight * 0.020),
                   const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1,)),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider(thickness: 1,)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center items horizontally
                        crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
                        children: [
                          Image.asset(Assets.imagesGoogle, height: screenHeight * 0.03),
                          SizedBox(width: 8), // Add some space between image and text
                          Text("Continue with Google", style: TextStyle(fontFamily: AppFontsFamily.poppins, color: AppColors.primaryColor, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontFamily: AppFontsFamily.poppins),
                        ),
                        TextButton(
                          onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: AppFontsFamily.poppins),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
