import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey = '3b925602504882bc48a603ae3f28dd42'; //requested from the site
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String typedCityName) async {
    // this method takes a city name returns a decoded json file contains the weather data

    NetworkHelper networkHepler = NetworkHelper(
        '$openWeatherMapURL?q=$typedCityName&appid=$apikey&units=metric');
    var weatherData = await networkHepler.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    // this method returns a decoded json file contains the weather data
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHepler = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHepler.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    //condition: one of the data provided by the site in the json file, there is an interpretation for that each number means inm the site.
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

  String getWeatherMessage(int temp) {
    //temp: one of the data provided by the site in the json file
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
