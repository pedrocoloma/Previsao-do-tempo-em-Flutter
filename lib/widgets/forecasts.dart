import 'package:flutter/material.dart';
import 'forecast_box_widget.dart';

class Forecasts extends StatefulWidget {
  var data;

  Forecasts({this.data});

  @override
  _ForecastsState createState() => _ForecastsState();
}

class _ForecastsState extends State<Forecasts> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);

    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ForecastBox(
          displayDay: "Amanhã",
          medianTemperature: widget.data["list"][0]["temp"],
          minTemperature: 16,
          maxtemperature: 24,
          weatherIcon: "☀",
        ),
        ForecastBox(
          displayDay: "Dia 21",
          medianTemperature: 22,
          minTemperature: 16,
          maxtemperature: 24,
          weatherIcon: "☁️",
        ),
        ForecastBox(
          displayDay: "Dia 22",
          medianTemperature: 22,
          minTemperature: 16,
          maxtemperature: 24,
          weatherIcon: "☁️",
        ),
      ],
    );
  }
}
