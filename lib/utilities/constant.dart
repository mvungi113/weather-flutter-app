import "package:flutter/material.dart";

const kBackgroundColor = Color(0xFF121212);
const kPrimaryColor = Color(0xFFFFBD73);

const kCityNameTextStyle = TextStyle(
  fontFamily: 'openSans',
  fontWeight: FontWeight.bold,
  fontSize: 48.0,
  color: Colors.white,
);

const kTemperatureTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 32.0,
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontFamily: 'OpenSans',
);

const smalTempTextStyle = TextStyle(
  color: Color(0XFFE5E5E5),
  fontFamily: 'OpenSan',
  fontSize: 32.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32.0,
  fontFamily: 'OpenSans',
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.place,
    color: Colors.grey,
  ),

  hintText: 'City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none
  )
);
