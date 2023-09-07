import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  void updateCityName(String value) {
    setState(() {
      cityName = value;
    });
  }

  void submitCityName() {
    if (cityName == '') {
      AlertDialog alert = AlertDialog(
        title: Text("Error while getting weather data."),
        content: Text("Insert a city name."),
        actions: [
          TextButton(
              onPressed: () => {
                    Navigator.of(context).pop(),
                  },
              child: Text("OK")),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      return;
    }

    Navigator.pop(context, cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: updateCityName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextInputDecoration,
                ),
              ),
              TextButton(
                onPressed: submitCityName,
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
