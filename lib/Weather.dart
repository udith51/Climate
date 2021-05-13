import 'package:climate_app/Location.dart';
import 'Networking.dart';

const appid = '5e5f23852e09ae1e8c813754c7802cba';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherURL?q=$cityName&appid=$appid&units=metric';
    Networking networking = Networking(url: url);
    var getWeather = await networking.getData();
    print(url);
    return getWeather;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.lat);
    Networking networking = Networking(
        url:
            '$openWeatherURL?lat=${location.lat}&lon=${location.long}&appid=$appid&units=metric');
    var getWeather = await networking.getData();
    return getWeather;
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
