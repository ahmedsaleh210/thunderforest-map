import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding_resolver/geocoding_resolver.dart';
import 'package:geolocator/geolocator.dart';

class MapServices {
  List<Marker> getMarker(location) {
    return List.generate(
        1,
        (index) => Marker(
              width: 80.0,
              height: 80.0,
              point: location,
              builder: (context) => const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 50.0,
              ),
            ));
  }

  final geoCoder = GeoCoder();
  Future<Address> getAddressFromLatLng(
      {required double latitude, required double longitude}) async {
    return await geoCoder.getAddressFromLatLng(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<Position> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
