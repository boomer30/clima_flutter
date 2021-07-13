import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    print('Lat: ${currentLocation.latitude} Lon: ${currentLocation.longitude}');
  }

  @override
  void initState() {
    getLocation();
    print('got here');
    super.initState();
  }

  void getData() async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=329a1a6e4f032cef991a734c0012deba');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
