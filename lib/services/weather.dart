import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'dart:convert';

const apiKey = '4e6304b244d8a3148abb87242337b2b9';

class WeatherModel {

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    var loc = await location.getLocation();
    NetworkHelper network = NetworkHelper();
    var weatherData = await network.getData(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var decodedData = jsonDecode(weatherData.body);
    return decodedData;
  }


  Future<dynamic> getCityWeatherData(cityName) async {
    print("Hello $cityName");
    NetworkHelper network = NetworkHelper();
    var weatherData = await network.getData(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var decodedData = jsonDecode(weatherData.body);
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
