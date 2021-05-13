//Loading Screen:
// Backend-> Lat/long/Temperature
//Frontend-> Show spinner while loading and ultimately lead to Location_Screen
import 'package:flutter/material.dart';
import 'package:climate_app/Weather.dart';
import 'Location_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var getWeather = await weatherModel.getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: getWeather,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.grey,
        size: 100.0,
      ),
    );
  }
}
