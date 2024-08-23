import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AppGeoLocator {
  static Future<Position?> getUserCoordinates() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<List<String>> getCityProvince() async {
    Position? position = await getUserCoordinates();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        position?.latitude ?? 0.0, position?.longitude ?? 0.0);

    String city = placemarks.first.locality ?? '';
    String province = placemarks.first.subAdministrativeArea ?? '';

    return [city, province];
  }
}
