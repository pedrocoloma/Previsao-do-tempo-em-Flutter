import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ForecastBox extends StatelessWidget {
  final String displayDay;
  final int medianTemperature;
  final int minTemperature;
  final int maxtemperature;
  final String weatherIcon;

  ForecastBox({
    this.displayDay,
    this.medianTemperature,
    this.minTemperature,
    this.maxtemperature,
    this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            displayDay,
            style: kMessageTextStyle,
          ),
          Text(
            "$medianTemperature° $weatherIcon",
            style: kForecastTextStyle,
          ),
          Column(
            children: <Widget>[
              Text(
                "Max $maxtemperature°",
                style: kForecastMinMaxTextStyle,
              ),
              Text(
                "Min $minTemperature°",
                style: kForecastMinMaxTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
