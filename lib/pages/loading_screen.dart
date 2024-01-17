import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/pages/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await requestLocationPermission();
    } else {
      getLocationData();
    }
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      getLocationData();
    }else{
      // handle case when user denies perimission
      // you can display a message or guide the user to settings
      //to enable permissions manually
    }
  }

  // get location here
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
