import 'package:flutter/material.dart';
import 'package:weather/pages/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constant.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});

  final locationWeather;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();
  DateTime date = DateTime.now();
  int? temperature;
  int? temperatureMin;
  int? temperatureMax;
  String? WeatherIcon;
  String? cityName;
  String? dayName;
  String? weatherCondition;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState((){
      if (weatherData == null
        || weatherData['main'] == null ||
        weatherData['weather'] == null ||
        weatherData['name'] == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        WeatherIcon = 'Error';
        cityName = '';
        weatherCondition = '';
        return;
        
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();

      var tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();

      var condition = weatherData['weather'][0]['id'];
      WeatherIcon = weather.getWeatherIcon(condition);

      cityName = weatherData['name'];
      dayName = DateFormat('EEE').format(date);
      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '$cityName',
                        // style to be added
                         style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Text(
                      '$dayName',
                      // style to be added
                       style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/$WeatherIcon.png',
                  height: 160,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        '$temperature °',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Text(
                      '$weatherCondition'.toUpperCase(),
                       style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                    Image.asset(
                      'assets/images/thermometer_low.png',
                      height: 50.0,
                    ),
                    Text(
                      '$temperatureMin °', 
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                    ),
                    Image.asset(
                      'assets/images/thermometer_high.png',
                      height: 50.0,
                    ),
                   Text(
                      '$temperatureMax °',
                       style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.near_me,
          color: Colors.white,
        ),
        highlightColor: Colors.transparent,
        splashRadius: 27.5,
        onPressed: () async {
          var weatherData = await weather.getLocationWeather();
          updateUI(weatherData);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          highlightColor: Colors.transparent,
          splashRadius: 27.5,
          onPressed: () async {
            var typedName = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return CityScreen();
            }));
            if (typedName != null) {
              var weatherData = await weather.getCityWeather(typedName);
              updateUI(weatherData);
            }
          },
        )
      ],
    );
  }
}
