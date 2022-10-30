import 'package:flutter/material.dart';
import 'package:untitled1/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/services/weather.dart';
import 'package:untitled1/screens/city_screen.dart';
class LocationScreen extends StatefulWidget {
  final locationData;


  LocationScreen({this.locationData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temprature;
  late String weatherIcon;
  late String cityName;
  late String getMessage;
  WeatherModel w=WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temprature=0;
        weatherIcon='Error';
        getMessage='unable to get message';
        cityName='';
        return;
      }
    double temp=weatherData['main']['temp'];
    temprature=temp.toInt();
    getMessage=w.getMessage(temprature);
    var condition=weatherData['weather'][0]['id'];
    weatherIcon=w.getWeatherIcon(condition);
    cityName=weatherData['name'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weatherData=await w.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                    var NamedData=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                    if(NamedData!=null){
                      var weatherData=await w.getCityName(NamedData);
                      updateUI(weatherData);
                    }
                    },

                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$getMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
