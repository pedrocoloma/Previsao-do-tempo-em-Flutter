import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "283e742d547debf5c79ac5fc32ffe840";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/";

class WeatherData {
  dynamic current;
  dynamic forecast;

  WeatherData({this.current, this.forecast});
}

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper currentNetworkHelper = NetworkHelper(
        url:
            "${openWeatherMapURL}weather?q=$cityName&appid=$apiKey&units=metric");
    NetworkHelper forecastNetworkHelper = NetworkHelper(
        url:
            "${openWeatherMapURL}forecast?q=$cityName&appid=$apiKey&unit=metric");

    var data = WeatherData();

    data.current = await currentNetworkHelper.getData();
    data.forecast = await forecastNetworkHelper.getData();

    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper currentNetworkHelper = NetworkHelper(
        url:
            "${openWeatherMapURL}weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    NetworkHelper forecastNetworkHelper = NetworkHelper(
        url:
            "${openWeatherMapURL}forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var data = WeatherData();

    data.current = await currentNetworkHelper.getData();
    data.forecast = await forecastNetworkHelper.getData();

    return data;
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
      return '☁';
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
