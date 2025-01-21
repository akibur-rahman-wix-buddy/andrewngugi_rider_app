import 'package:andrewngugi_rider_app/drivers_side_features/controller/map_controller.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart' as places_sdk;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import 'map_model.dart';




class MapScreen extends StatefulWidget {
  static const _initialCameraPosition = maps.CameraPosition(
    target: maps.LatLng(37.773972, -122.431297),
    zoom: 14.5,
  );

  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapController = Get.put(MapController());

  @override
  void dispose() {
    mapController?.dispose(); // Dispose the map controller if necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Obx(() => maps.GoogleMap(
              initialCameraPosition: MapScreen._initialCameraPosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              onMapCreated: mapController.setGoogleMapController,
              markers: {
                if (mapController.origin != null) mapController.origin!,
                if (mapController.destination != null) mapController.destination!,
                if (mapController.userLocationMarker != null) mapController.userLocationMarker!,
              },
              polylines: {
                if (mapController.info != null && mapController.info!.polylinePoints.isNotEmpty)

                  maps.Polyline(
                    polylineId: const maps.PolylineId('overview_polyline'),
                    color: Colors.blue,
                    width: 5,
                    points: mapController.info!.polylinePoints
                        .map((e) => maps.LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
            )),
            if (mapController.info != null)
              Positioned(
                top: 50.0.h,
                left: 20.0.w,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Text(
                    '${mapController.info!.totalDistance}, ${mapController.info!.totalDuration}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            Positioned(
              right: 15,
              bottom: 30,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () => mapController.getDirections(context),
                    child: const Icon(Icons.directions),
                  ),
                  UIHelper.verticalSpace(20.h),
                  FloatingActionButton(
                    onPressed: () => mapController.showUserLocation(context),
                    child: const Icon(Icons.my_location),
                  ),
                ],
              ),
            )
          ],
        );
      }),


    );
  }
}


/// >>>>>>>>>>>>>>>> direction repository >>>>>>>>>>>>>>>>>>>>>>>>>

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';
  static const String _apiKey = 'AIzaSyDmNO0nvvAkkxk6rYBDQEfVXVQPB9rKlsk'; // Replace with your actual API key

  final Dio _dio;

  DirectionsRepository({required Dio dio}) : _dio = dio;

  Future<Directions?> getDirectionsFromAddresses({
    required String origin,
    required String destination,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'origin': Uri.encodeComponent(origin),
          'destination': Uri.encodeComponent(destination),
          'key': _apiKey,
        },
      );

      // Log the response for debugging purposes
      debugPrint('Response: ${response.data}');  // Add this line to log the response

      if (response.statusCode == 200 && response.data != null) {
        final routes = response.data['routes'] as List;
        if (routes.isEmpty || response.data['status'] != 'OK') {
          return null;
        }
        return Directions.fromMap(response.data);
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching directions: $e');
      return null;
    }
  }
}