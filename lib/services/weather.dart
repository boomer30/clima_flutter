import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/location.dart';

const apiKey = '329a1a6e4f032cef991a734c0012deba';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeather({String cityName}) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&APPID=$apiKey&units=imperial');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location currentLocation = Location();
    print('getting location data');
    await currentLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&APPID=$apiKey&units=imperial');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 95) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 80) {
      return 'Time for shorts and ๐';
    } else if (temp < 30) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
