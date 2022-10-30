import 'package:untitled1/services/networking.dart';
import 'package:untitled1/services/location.dart';
import 'package:untitled1/services/location.dart';
const id='3325284b6038304d1f03d3300d56d568';
const openWeatherApi='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityName(String CityName)async{
    var url='$openWeatherApi?q=$CityName&appid=$id&units=metric';
    Network n=new Network(url);
    var weatherData=await n.getData();
    return weatherData;
  }
  Future<dynamic>getLocationWeather()async{
    Location loca=Location();
    await loca.getCurrentLaocation();
    Network n=new Network("$openWeatherApi?lat=${loca.lati}&lon=${loca.long}&appid=$id&units=metric");
    n.getData();
    var weatherData=await n.getData();
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
