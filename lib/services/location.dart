import 'package:geolocator/geolocator.dart';

//This Class aims to get the permission to access the location, as well as getting the longitude and latitude of the location

class Location {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    // calling this function will update the longitude and latitude.
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      print(permission);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      //increasing the accuracy will bo more battery consuming
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
