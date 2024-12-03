import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class CustomToggle extends StatefulWidget {
  final int initialSelectedIndex;
  final ValueChanged<int> onTap;

  CustomToggle({
    Key? key,
    this.initialSelectedIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        color: AppColors.textFiledColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
              widget.onTap(0);
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 0
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.03),
              child: Text(
                'Public User',
                style: TextStyle(
                  fontFamily: AppFontsFamily.poppins,
                  color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
              widget.onTap(1);
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 1
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenWidth * 0.03),
              child: Text(
                'Organizer',
                style: TextStyle(
                  fontFamily: AppFontsFamily.poppins,
                  color: _selectedIndex == 1 ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
