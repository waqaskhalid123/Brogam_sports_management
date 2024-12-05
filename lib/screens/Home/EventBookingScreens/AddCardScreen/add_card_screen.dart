import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../../services/constants/constants.dart';
import '../../../../widgets/CutomTextField/custom_textField.dart';
import '../BookingSuccessScreen/booking_success_screen.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  // Dropdown options
  final List<String> months = [
    "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"
  ];
  final List<String> years = List.generate(20, (index) => (DateTime.now().year + index).toString());
  bool isDefault = true;
  // Selected values
  String? selectedMonth;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Add Card", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Card preview
            Image.asset("assets/images/credit_card.png", width: double.infinity, ),
            // Form fields
            CustomField(
              controller: nameController,
              hintText: "Name on Card",
              keyboardType: TextInputType.name,
              validator: (value) => value == null || value.isEmpty
                  ? "Please enter the name on the card"
                  : null,
            ),
            SizedBox(height: 16),
            CustomField(
              controller: cardNumberController,
              hintText: "Card Number",
              keyboardType: TextInputType.number,
              validator: (value) =>
              value == null || value.isEmpty || value.length < 16
                  ? "Please enter a valid card number"
                  : null,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownField(
                    value: selectedMonth,
                    hintText: "Month",
                    items: months,
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomDropdownField(
                    value: selectedYear,
                    hintText: "Year",
                    items: years,
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomField(
              controller: cvcController,
              hintText: "CVC",
              keyboardType: TextInputType.number,
              validator: (value) =>
              value == null || value.isEmpty || value.length < 3
                  ? "Invalid CVC"
                  : null,
            ),
            SizedBox(height: 16),

            // Set as default switch
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: isDefault,
                    onChanged: (value) {
                      setState(() {
                        isDefault = !isDefault;
                      });
                    },
                    activeColor: AppColors.secondaryColor,
                  ),
                ),
                const Text(
                  "SET AS DEFAULT",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Add Card button
            ActionButton(text: "Add Card", backgroundColor: AppColors.primaryColor, textColor: AppColors.white, borderColor: AppColors.primaryColor, onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingSuccessScreen(),));
            }, borderRadius: 25,)
          ],
        ),
      ),
    );
  }
}



class CustomDropdownField extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdownField({
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.textFiledColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(hintText),
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}


