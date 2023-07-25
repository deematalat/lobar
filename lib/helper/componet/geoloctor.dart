import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation{

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        // Handle location permission denied by the user
        return null;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      // Handle any errors that occurred while retrieving the location
      print('Error: $e');
      return null;
    }
  }

  Future<String> getLocationName(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String locationName = placemark.name ?? '';
        String city = placemark.locality ?? '';
        String country = placemark.country ?? '';
        return '$locationName, $city, $country';
      } else {
        return 'Location not found';
      }
    } catch (e) {
      print('Error: $e');
      return 'Error getting location';
    }
  }


}