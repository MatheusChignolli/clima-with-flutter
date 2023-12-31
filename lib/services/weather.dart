import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String apiKey = 'apiKey';
String openWeatherMapApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather(String? cityName) async {
    Location location = Location();

    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      return;
    }

    var url =
        '$openWeatherMapApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    if (cityName != null) {
      url = '$openWeatherMapApiUrl?q=$cityName&appid=$apiKey&units=metric';
    }

    NetworkHelper networkHelper = NetworkHelper(url);

    dynamic weatherData = await networkHelper.getData();

    return weatherData;
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
