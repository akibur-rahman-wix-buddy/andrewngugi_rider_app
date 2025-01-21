// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class DriverMapController extends GetxController {
//   GoogleMapController? _googleMapController;
//   final _userLocationMarker = Rxn<Marker>();
//   Location location = Location();
//
//   Marker? get userLocationMarker => _userLocationMarker.value;
//
//   void setGoogleMapController(GoogleMapController controller) {
//     _googleMapController = controller;
//     updateUserLocation();  // Corrected method call
//   }
//
//   Future<void> updateUserLocation() async {
//     final userLocation = await location.getLocation();
//     final latLng = LatLng(userLocation.latitude!, userLocation.longitude!);
//
//     // Update the marker with the user's location
//     _userLocationMarker.value = Marker(
//       markerId: const MarkerId("user_location"),
//       position: latLng,
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       infoWindow: const InfoWindow(title: "You are here"),
//     );
//
//     // Move the camera to the user's location
//     _googleMapController?.animateCamera(
//       CameraUpdate.newLatLng(latLng),
//     );
//   }
// }


import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverMapController extends GetxController {
  GoogleMapController? _googleMapController;
  final _userLocationMarker = Rxn<Marker>();
  final isLoading = false.obs;
  Location location = Location();

  Marker? get userLocationMarker => _userLocationMarker.value;

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission(); // Check permissions on controller initialization
  }

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
    updateUserLocation(); // Automatically update location when map is created
  }

  Future<void> _checkLocationPermission() async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == PermissionStatus.denied) {
      final granted = await location.requestPermission();
      if (granted != PermissionStatus.granted) {
        Get.snackbar("Permission Denied", "Location permission is required.");
        return;
      }
    }

    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final enabled = await location.requestService();
      if (!enabled) {
        Get.snackbar("Service Disabled", "Please enable location services.");
        return;
      }
    }
  }

  Future<void> updateUserLocation() async {
    isLoading.value = true; // Start loading

    try {
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
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    } finally {
      isLoading.value = false; // End loading
    }
  }

  void startListeningToLocationChanges() {
    location.onLocationChanged.listen((userLocation) {
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
    });
  }
}
