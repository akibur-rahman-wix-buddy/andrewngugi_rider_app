import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;



///>>>>>>>>>>>>>>>>>>>>> directions model>>>>>>>>>>>>>>>>>>>>>>>>>

class Directions {
  final maps.LatLng origin;
  final maps.LatLng destination;
  final maps.LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  Directions({
    required this.origin,
    required this.destination,
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    if ((map['routes'] as List).isEmpty) {
      throw Exception('No routes found');
    }

    final data = map['routes'][0];
    final bounds = maps.LatLngBounds(
      northeast: maps.LatLng(
        data['bounds']['northeast']['lat'],
        data['bounds']['northeast']['lng'],
      ),
      southwest: maps.LatLng(
        data['bounds']['southwest']['lat'],
        data['bounds']['southwest']['lng'],
      ),
    );

    String distance = '';
    String duration = '';

    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    final origin = maps.LatLng(
      data['legs'][0]['start_location']['lat'],
      data['legs'][0]['start_location']['lng'],
    );
    final destination = maps.LatLng(
      data['legs'][0]['end_location']['lat'],
      data['legs'][0]['end_location']['lng'],
    );

    return Directions(
      origin: origin,
      destination: destination,
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}