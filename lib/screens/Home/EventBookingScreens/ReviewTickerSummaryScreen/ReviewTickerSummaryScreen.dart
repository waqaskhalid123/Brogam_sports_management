import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/VerticalEventCard/vertical_event_card.dart';
import '../AddCardScreen/add_card_screen.dart';

class ReviewTicketSummaryScreen extends StatefulWidget {
  @override
  _ReviewTicketSummaryScreenState createState() => _ReviewTicketSummaryScreenState();
}

class _ReviewTicketSummaryScreenState extends State<ReviewTicketSummaryScreen> {
  String _selectedPayment = 'Paypal';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
        title: const Text(
          'Review Ticket Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          final contentPadding = isSmallScreen ? 15.0 : 32.0;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalEventCard(length: 1),
                  const SizedBox(height: 16),
                  _buildUserDetails(),
                  const SizedBox(height: 16),
                  _buildPaymentSummary(),
                  const SizedBox(height: 16),
                  _buildCreditDebitCardSection(),
                  const SizedBox(height: 16),
                  _buildMorePaymentOptions(),
                  const SizedBox(height: 16),
                  ActionButton(text: "Book Slow", backgroundColor: AppColors.primaryColor, textColor: AppColors.white, borderColor: AppColors.primaryColor, onPressed: (){}, borderRadius: 25,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Full Name', 'Sofia Anderson'),
        _buildDetailRow('Phone Number', '+1 (208) 555-0112'),
        _buildDetailRow('Email', 'sofia@email.com'),
      ],
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      children: [
        _buildDetailRow('1 Ticket', '\$20', isBold: true),
        _buildDetailRow('Service Fees', '\$2', isBold: true),
        Divider(color: Colors.grey.shade300),
        _buildDetailRow('Total', '\$22', isBold: true),
      ],
    );
  }

  Widget _buildCreditDebitCardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Credit & Debit Card',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.credit_card, color: Colors.grey),
            title: const Text(
              'Add Card',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            trailing:  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardScreen(),));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMorePaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More Payment Options',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        _buildPaymentOption('Paypal', Icons.paypal),
        _buildPaymentOption('Apple Pay', Icons.apple),
        _buildPaymentOption('Stripe', Icons.credit_card),
        _buildPaymentOption('Google Play', Icons.android),
      ],
    );
  }

  Widget _buildPaymentOption(String label, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        label,
        style: const  TextStyle(
          fontFamily: AppFontsFamily.poppins,
          fontSize: AppFontSizes.body,
          color: Colors.black,
        ),
      ),
      trailing: Radio<String>(
        value: label,
        activeColor: AppColors.primaryColor,
        groupValue: _selectedPayment,
        onChanged: (value) {
          setState(() {
            _selectedPayment = value!;
          });
        },
      ),
    );
  }
}
