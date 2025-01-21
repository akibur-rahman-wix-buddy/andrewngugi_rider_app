import 'package:andrewngugi_rider_app/drivers_side_features/controller/map_implementation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart' as places_sdk;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'map_model.dart';

class MapController extends GetxController {
  // Text controllers for input fields
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  // Google Places SDK
  final places_sdk.FlutterGooglePlacesSdk _places =
  places_sdk.FlutterGooglePlacesSdk('AIzaSyDmNO0nvvAkkxk6rYBDQEfVXVQPB9rKlsk');

  // Google Map controller
  late maps.GoogleMapController _googleMapController;

  // Reactive variables for map markers and directions
  final Rx<maps.Marker?> _origin = Rx<maps.Marker?>(null);
  final Rx<maps.Marker?> _destination = Rx<maps.Marker?>(null);
  final Rx<Directions?> _info = Rx<Directions?>(null);
  final Rx<maps.Marker?> _userLocationMarker = Rx<maps.Marker?>(null);

  // Getters for markers and directions
  maps.Marker? get origin => _origin.value;
  maps.Marker? get destination => _destination.value;
  Directions? get info => _info.value;
  maps.Marker? get userLocationMarker => _userLocationMarker.value;


  // Set Google Map Controller
  void setGoogleMapController(maps.GoogleMapController controller) {
    _googleMapController = controller;
  }


  /// Fetch and display directions
  Future<void> getDirections(BuildContext context) async {
    final originText = originController.text;
    final destinationText = destinationController.text;

    if (originText.isEmpty || destinationText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both origin and destination.')),
      );
      return;
    }

    try {
      final directions = await DirectionsRepository(dio: Dio())
          .getDirectionsFromAddresses(origin: originText, destination: destinationText);

      if (directions != null) {
        // Update markers and directions reactively
        _origin.value = maps.Marker(
          markerId: const maps.MarkerId('origin'),
          infoWindow: const maps.InfoWindow(title: 'Origin'),
          icon: maps.BitmapDescriptor.defaultMarkerWithHue(maps.BitmapDescriptor.hueGreen),
          position: directions.origin,
        );

        _destination.value = maps.Marker(
          markerId: const maps.MarkerId('destination'),
          infoWindow: const maps.InfoWindow(title: 'Destination'),
          icon: maps.BitmapDescriptor.defaultMarkerWithHue(maps.BitmapDescriptor.hueRed),
          position: directions.destination,
        );

        _info.value = directions;

        // Animate the camera to show the bounds
        if (directions.bounds.northeast != null && directions.bounds.southwest != null) {
          _googleMapController.animateCamera(
            maps.CameraUpdate.newLatLngBounds(directions.bounds, 100.0),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Directions not found!')),
        );
      }
    } catch (e) {
      debugPrint('Error fetching directions: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching directions: $e')),
      );
    }
  }

  /// Show user's current location on the map
  Future<void> showUserLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enable location services or check your internet.')),
      );
      return;
    }

    // Check for location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permissions are permanently denied.')),
      );
      return;
    }

    try {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Create a marker for the user's location
      _userLocationMarker.value = maps.Marker(
        markerId: const maps.MarkerId('userLocation'),
        position: maps.LatLng(position.latitude, position.longitude),
        infoWindow: const maps.InfoWindow(title: 'My Location'),
        icon: maps.BitmapDescriptor.defaultMarkerWithHue(maps.BitmapDescriptor.hueRed),

      );

      // Animate the camera to the user's current position
      _googleMapController.animateCamera(
        maps.CameraUpdate.newLatLng(
          maps.LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      debugPrint('Error fetching user location: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user location: $e')),
      );
    }
  }
}
