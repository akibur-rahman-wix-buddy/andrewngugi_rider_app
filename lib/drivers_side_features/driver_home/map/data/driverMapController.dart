// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart'; // For reverse geocoding
//
// class DriverMapController extends GetxController {
//   // Google Map controller
//   late GoogleMapController _googleMapController;
//
//   // Reactive marker for user's location
//   final Rx<Marker?> _userLocationMarker = Rx<Marker?>(null);
//
//   Marker? get userLocationMarker => _userLocationMarker.value;
//
//   // Set the Google Map Controller
//   void setGoogleMapController(GoogleMapController controller) {
//     _googleMapController = controller;
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     Future.delayed(Duration.zero, () => showDriverLocation(Get.context!));
//   }
//
//   /// Show the driver's current location on the map
//   Future<void> showDriverLocation(BuildContext context) async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Get.snackbar('Error', 'Please enable location services.');
//       return;
//     }
//
//     // Request location permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         Get.snackbar('Error', 'Location permission denied.');
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       Get.snackbar(
//         'Error',
//         'Location permissions are permanently denied. Please enable them from settings.',
//       );
//       return;
//     }
//
//     try {
//       // Fetch current location
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       // Get location name (reverse geocoding)
//       String locationName = "Unknown Location";
//       try {
//         List<Placemark> placemarks = await placemarkFromCoordinates(
//           position.latitude,
//           position.longitude,
//         );
//         if (placemarks.isNotEmpty) {
//           locationName =
//           "${placemarks.first.locality}, ${placemarks.first.administrativeArea}";
//         }
//       } catch (e) {
//         debugPrint('Error fetching location name: $e');
//       }
//
//       // Update the map marker with location name
//       _userLocationMarker.value = Marker(
//         markerId: const MarkerId('userLocation'),
//         position: LatLng(position.latitude, position.longitude),
//         infoWindow: InfoWindow(title: locationName),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       );
//
//       // Animate the camera to the user's location
//       _googleMapController.animateCamera(
//         CameraUpdate.newLatLng(
//           LatLng(position.latitude, position.longitude),
//         ),
//       );
//     } catch (e) {
//       Get.snackbar('Error', 'Could not fetch location: $e');
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverMapController extends GetxController {
  GoogleMapController? _googleMapController;
  final _userLocationMarker = Rxn<Marker>();
  Location location = Location();

  Marker? get userLocationMarker => _userLocationMarker.value;

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
    updateUserLocation();  // Corrected method call
  }

  Future<void> updateUserLocation() async {
    final userLocation = await location.getLocation();
    final latLng = LatLng(userLocation.latitude!, userLocation.longitude!);

    // Update the marker with the user's location
    _userLocationMarker.value = Marker(
      markerId: const MarkerId("user_location"),
      position: latLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: "You are here"),
    );

    // Move the camera to the user's location
    _googleMapController?.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}
