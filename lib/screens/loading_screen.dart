import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '329a1a6e4f032cef991a734c0012deba';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location currentLocation = Location();
    print('getting location data');
    await currentLocation.getCurrentLocation();

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    print('Location: $latitude, $longitude');

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$apiKey&units=imperial');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
