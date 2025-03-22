

import 'package:andrewngugi_rider_app/drivers_side_features/driver_home/map/data/driverMapController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DriverMapScreen extends StatelessWidget {
  const DriverMapScreen({super.key});

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297), // Default location (San Francisco)
    zoom: 14.5,
  );

  @override
  Widget build(BuildContext context) {
    final mapController = Get.put(DriverMapController());

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: mapController.setGoogleMapController,
              markers: mapController.userLocationMarker != null
                  ? {mapController.userLocationMarker!}
                  : {},
            ),
            Positioned(
              bottom: 115.h,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  // Update the user's location when the button is pressed
                  mapController.updateUserLocation();
                },
                backgroundColor: Colors.orange,
                child: Obx(() {
                  // Show a loading indicator or the location icon
                  return mapController.isLoading.value
                      ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      : const Icon(Icons.my_location, color: Colors.white);
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}

