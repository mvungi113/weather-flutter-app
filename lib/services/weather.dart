import 'package:weather/services/location.dart';
import 'package:weather/services/network.dart';

const apikey = 'user your api key';
const openWeatherMapURL =
   
    'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&exclude={part}&appid=$apikey';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
    '$openWeatherMapURL&q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition){
      if (condition < 300) {
      return 'thunder';
    } else if (condition < 400) {
      return 'drizzle';
    } else if (condition == 500) {
      return 'rain';
    } else if (condition < 600) {
      return 'heavy_rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'fog';
    } else if (condition == 800) {
      return 'sun';
    } else if (condition <= 804) {
      return 'cloud';
    } else {
      return 'thermometer';
    }
  }
}
