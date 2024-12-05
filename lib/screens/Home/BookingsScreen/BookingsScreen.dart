import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/BookingsProvider.dart';  // Ensure this is the correct path
import '../../../services/constants/constants.dart';
import '../../../widgets/PrimaryButton/CustomPrimaryButton.dart';
import '../../../widgets/ToggleButton/ToggleButton.dart';

class BookingsScreen extends StatelessWidget {
  final ongoingBookings = [
    {
      "title": "Swimming",
      "tickets": 1,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
    {
      "title": "Swimming",
      "tickets": 3,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
    {
      "title": "Swimming",
      "tickets": 8,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
  ];

  final completedBookings = [
    {
      "title": "Swimming",
      "tickets": 1,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
    {
      "title": "Swimming",
      "tickets": 3,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
    {
      "title": "Swimming",
      "tickets": 8,
      "date": "25 Dec, 24",
      "EventName": "Swimming Competition",
      "location": "Florida"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Ensure the provider is correctly used
    final bookingProvider = Provider.of<BookingProvider>(context);

    // Dynamically select the bookings list based on the provider's state
    final bookings = bookingProvider.isOngoing ? ongoingBookings : completedBookings;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookings',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: AppFontsFamily.poppins,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Custom Toggle Button
          BookingsToggle(),
          SizedBox(height: 16.0),
          Text(
            'My Event Bookings',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          // Booking List
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];

                return Card(
                  child: Container(
                    padding: EdgeInsets.all(18.0),
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Image.asset(
                                "assets/image/card2.png",
                                height: MediaQuery.of(context).size.height * 0.2, // Responsive image height
                                width: MediaQuery.of(context).size.width * 0.4, // Responsive image width
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking["title"] as String,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: AppColors.secondaryColor,
                                      fontFamily: AppFontsFamily.poppins,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    booking["EventName"] as String,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontFamily: AppFontsFamily.poppins,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        size: 18.0,
                                        color: AppColors.secondaryColor,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        booking["location"] as String,
                                        style: TextStyle(color: AppColors.grey,
                                            fontSize: 10,
                                            fontFamily: AppFontsFamily.poppins
                                        ),
                                      ),
                                      SizedBox(width: 16.0),
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 18.0,
                                        color: AppColors.secondaryColor,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        booking["date"] as String,
                                        style: TextStyle(color: AppColors.grey,
                                            fontSize: 10,
                                            fontFamily: AppFontsFamily.poppins
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "${booking["tickets"]} Tickets",
                                    style: TextStyle(color: AppColors.secondaryColor,
                                        fontSize: 18,
                                        fontFamily: AppFontsFamily.poppins
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              // Cancel Booking (Ongoing Only)
                              if (bookingProvider.isOngoing)
                                InkWell(
                                  onTap: () {
                                    // Navigate to profile when cancel is tapped
                                    bookingProvider.navigateToProfile(context);
                                  },
                                  child: Container(
                                    height: 32,
                                    child: Center(
                                      child: Text(
                                        'Cancel Booking',
                                        style: TextStyle(
                                          color: AppColors.CancelRed,
                                          fontSize: 14.0,
                                          fontFamily: AppFontsFamily.poppins,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (bookingProvider.isOngoing)
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.07,
                                ),
                              Expanded(
                                child: PrimaryButton(
                                  height: 32,
                                  onPressed: () {
                                    // Navigate to ticket details when the button is pressed
                                    bookingProvider.navigateToTicket(context);
                                  },
                                  text: 'View Ticket',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
