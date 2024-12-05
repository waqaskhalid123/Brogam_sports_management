import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../providers/LocationProvider.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../../../widgets/HorizontalMapCard/horizontal_map_card.dart';
import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late GoogleMapController _mapController;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Get the user's current location and move to it
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider = Provider.of<LocationProvider>(context, listen: false);
      locationProvider.getCurrentLocation(context).then((_) {
        _moveToCurrentLocation(locationProvider);
      });
    });
  }

  void _moveToCurrentLocation(LocationProvider locationProvider) {
    if (locationProvider.currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationProvider.currentLocation!.latitude!,
              locationProvider.currentLocation!.longitude!,
            ),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: locationProvider.currentLocationMarker != null
                ? {locationProvider.currentLocationMarker!}
                : {},
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // FloatingActionButton
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                      ),
                      onPressed: () {
                        locationProvider.getCurrentLocation(context).then((_) {
                          _moveToCurrentLocation(locationProvider);
                        });
                      },
                      child: Icon(Icons.my_location),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Number of items in the horizontal list
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                        },
                          child: const HorizontalMapCard());
                    },
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: CustomField(
              hintText: "Search",
              controller: _searchController,
              keyboardType: TextInputType.text,
              validator: (p0) {

              },
              suffixIcon: Icon(CupertinoIcons.slider_horizontal_3),
              prefixIcon:  Icon(CupertinoIcons.search, color: AppColors.primaryColor,),
            ),
          )
        ],
      ),
    );
  }
}
