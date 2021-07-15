import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      print('getting current location');
      Position position = await Geolocator.getCurrentPosition(
              forceAndroidLocationManager: true,
              desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
    } catch (e) {
      print(e);
      Position position = await Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: true);
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
