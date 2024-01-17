import 'package:flutter/material.dart';
import 'package:weather/utilities/constant.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Column(children: <Widget>[
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: kTextFieldInputDecoration,
            onChanged: (value) {
              cityName = value;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.blue,
                primary: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: const Text(
                'Search',
                style: kButtonTextStyle,
              ),
            ),
          )
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashRadius: 27.5,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
      ),
    );
  }
}
