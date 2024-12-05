import 'package:brogam/providers/TicketCounterProvider.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CurvedEdges/curved_edges.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/ReadMoreWidget/read_more_widget.dart';
import '../EventBookingDeatailScreen/event_booking_detail_screen.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({
    super.key,
  });

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  int _ticketCount = 1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,

      //bottom navigation bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ticket Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: AppFontSizes.body1,
                    color: AppColors.lighyGreyColor1,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$20.00',
                        style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.subtitle1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor),
                      ),
                      TextSpan(
                        text: '/person',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.small,
                          color: AppColors.lighyGreyColor1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            ActionButton(
                text: 'Buy Tickets',
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColor,
                buttonWidth: screenWidth * 0.5,
                borderRadius: 25,
                onPressed: () {
                  _openTicketBookingDrawer(context);
                })
          ],
        ),
      ),

      //main body
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              // Curved Edges with Image
              CurvedEdges(
                child: Container(
                  height: screenHeight * 0.30,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Back Arrow and Share Icon
              Positioned(
                top: 16,
                left: 16,
                child: CustomRoundedContainer(
                  radius: 100,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  showBorder: true,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      // size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: CustomRoundedContainer(
                  radius: 100,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  showBorder: true,
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.black),
                    onPressed: () {
                      // Share functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Share clicked!')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomRoundedContainer(
                      height: screenHeight * 0.022,
                      padding: const EdgeInsets.symmetric(
                          vertical: 00, horizontal: 10),
                      backgroundColor: AppColors.fill.withOpacity(1),
                      radius: 25,
                      child: Center(
                        child: Text(
                          'Swimming',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    CustomRoundedContainer(
                      height: screenHeight * 0.022,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      backgroundColor: AppColors.fill.withOpacity(1),
                      radius: 25,
                      child: Center(
                        child: Text(
                          'Physical',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Swimming Competition',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.subtitle,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
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
                        fontSize: 13,
                        color: AppColors.IconColors,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.030),
                    Icon(
                      Icons.calendar_month,
                      color: AppColors.secondaryColor,
                      size: AppFontSizes.body,
                    ),
                    SizedBox(width: screenWidth * 0.010),
                    Text(
                      '25 Dec, 24 - 10:00 AM',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontSize: 13,
                        color: AppColors.IconColors,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005),
                Divider(
                  color: AppColors.IconColors,
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Event Type',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Physical Competition Event',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.IconColors,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
               const Text(
                  'About Event',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                ReadMore(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.IconColors,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3, // Optional, defaults to 3
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontSize: AppFontSizes.body,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'Navigation',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.body1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.010),
                        Icon(
                          Icons.navigation,
                          color: AppColors.secondaryColor,
                          size: AppFontSizes.body,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005),
                Container(
                  height: screenHeight * 0.16,
                  width: screenWidth,
                  decoration: const  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _openTicketBookingDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRoundedContainer(
                  width: 60,
                  height: 5,
                  backgroundColor: AppColors.lighyGreyColor1,
                  radius: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Number of Tickets',
                      style: TextStyle(
                        fontSize: AppFontSizes.body,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        CustomRoundedContainer(
                          width: 40,
                          height: 40,
                          backgroundColor: AppColors.primaryColor,
                          radius: 10,
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              context.read<TicketCounterProvider>().decrementTicket();
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        CustomRoundedContainer(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          borderColor: AppColors.primaryColor,
                          radius: 10,
                          backgroundColor: Colors.white,
                          showBorder: true,
                          child: Consumer<TicketCounterProvider>(
                            builder: (context, ticketProvider, child) {
                              return Text(
                                '${ticketProvider.ticketCount}',
                                style: TextStyle(
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        CustomRoundedContainer(
                          width: 40,
                          height: 40,
                          backgroundColor: AppColors.primaryColor,
                          radius: 10,
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              context.read<TicketCounterProvider>().incrementTicket();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ActionButton(text: "Proceed To Booking", backgroundColor: AppColors.primaryColor, textColor: AppColors.white, borderColor: AppColors.primaryColor, borderRadius: 25, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventBookingDetailScreen(),));
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
