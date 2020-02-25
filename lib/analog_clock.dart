import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'dart:async';
import 'clock_controller.dart';
import 'space_particles.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  ClockController _clockController;
  FlutterActorArtboard artboard;
  String _timeString;
  String animate = 'Sun';
  int seconds;
  int hour;
  int minute;
  DateTime dateTime = DateTime.now();

  void _getCurrentTime() {
    dateTime = DateTime.now();
    setState(() {
      _timeString = "${dateTime.hour} ${dateTime.minute}";
      seconds = dateTime.second;
      hour = dateTime.hour;
      minute = dateTime.minute;

      _clockController.hour = hour;
      _clockController.minute = minute;
      _clockController.seconds = seconds;

      animate = _animationName(hour);
    });
  }

  String _animationName(int hour) {
    if (((hour >= 0) && (hour < 6)) || hour > 17)
      return 'Moon';
    else
      return 'Sun';
  }

  @override
  void initState() {
    hour = dateTime.hour;
    minute = dateTime.minute;
    seconds = dateTime.second;
    _timeString = "$hour $minute}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    _clockController = ClockController(
      'seconds',
      hour: hour,
      minute: minute,
      seconds: seconds,
    );
    animate = _animationName(hour);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SpaceParticles particles = SpaceParticles(height, width, 1500);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Semantics.fromProperties(
          properties: SemanticsProperties(
            label: 'The time is $_timeString',
            value: _timeString,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: 100,
                child: CustomPaint(
                  painter: particles,
                ),
              ),
              AspectRatio(
                aspectRatio: 5 / 3,
                child: FlareActor(
                  "assets/HMS.flr",
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft,
                  controller: _clockController,
                ),
                //child: Container(color: Colors.red,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(width - 400, 0, 0, 0),
                width: 400,
                height: 200,
                child: FlareActor(
                  "assets/$animate.flr",
                  fit: BoxFit.contain,
                  alignment: Alignment.topRight,
                  animation: 'Animate',
                ),
                //color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
