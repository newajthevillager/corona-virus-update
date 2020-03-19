import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CoronaCountryDetailsPage extends StatelessWidget {
  CoronaCountry country;

  CoronaCountryDetailsPage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${country.country.toUpperCase()}",
          style: TextStyle(
            color: Colors.teal,
            fontFamily: "RussoOne",
            letterSpacing: 2.5,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkBg,
      ),
      body: Container(
        color: AppColors.darkBg,
        child: ListView(
          padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
          children: <Widget>[
            // heading
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
              alignment: Alignment.center,
              child: Text(
                "CORONA VIRUS UPDATE",
                style: TextStyle(
                  color: Color.fromARGB(255,206,105,99),
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),

            // total cases
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.cases.toString(),
                style: TextStyle(
                  color: Colors.cyan,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "TOTAL CASES",
                style: TextStyle(
                  color: Colors.cyan,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // new cases
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.todayCases.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "NEW CASES",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // total deaths
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.deaths.toString(),
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "TOTAL DEATHS",
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // new deaths
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.todayDeaths.toString(),
                style: TextStyle(
                  color: Colors.red[900],
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "NEW DEATHS",
                style: TextStyle(
                  color: Colors.red[900],
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // recovered
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.recovered.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "RECOVERED",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // critical
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.critical.toString(),
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                "CRITICAL",
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            // actIVE CASES
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                country.active.toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "ACTIVE CASES",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "RussoOne",
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
