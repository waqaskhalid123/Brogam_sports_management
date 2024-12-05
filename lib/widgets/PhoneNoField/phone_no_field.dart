import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryCodeController =
      TextEditingController(text: "+1");
  final Color? borderColor;

  @override
  PhoneNumberField({super.key, this.borderColor});
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.textFiledColor,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: borderColor ?? Colors.transparent),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: _countryCodeController.text,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  _countryCodeController.text = newValue!;
                },
                items: <String>['+1', '+44', '+91', '+61']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: AppColors.lighyGreyColor1,
                          fontFamily: AppFontsFamily.poppins),
                    ),
                  );
                }).toList(),
                underline: const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textFiledColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: borderColor ?? Colors.transparent),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                        color: AppColors.lighyGreyColor1,
                        fontFamily: AppFontsFamily.poppins),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
