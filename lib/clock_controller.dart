import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/math/mat2d.dart';

class ClockController extends FlareControls {
  FlutterActorShape _hourShape;
  FlutterActorShape _minuteShape;
  FlutterActorShape _secondShape;

  FlutterColorStroke _hourStroke;
  FlutterColorStroke _minuteStroke;
  FlutterColorStroke _secondStroke;

  ActorAnimation _actor;

  final String _animation;
  int hour;
  int seconds;
  int minute;

  Color hourColor = Colors.white;
  Color minuteColor = Colors.white;
  Color secondColor = Colors.white;

  ClockController(this._animation,
      {@required this.hour,
      @required this.minute,
      @required this.seconds,
      this.hourColor: Colors.white,
      this.minuteColor: Colors.white,
      this.secondColor: Colors.white});

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _actor = artboard.getAnimation(_animation);
  }

  void setViewTransform(Mat2D viewTransform) {}

  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // advance is called whenever the flare artboard is about to update (before it draws).
    //get the shape of all the nodes
    _hourShape = artboard.getNode('${hour % 12}H');
    _minuteShape = artboard.getNode('$minute');
    _secondShape = artboard.getNode('sec');

    // Get the stroke of each shape to change its color
    _hourStroke = _hourShape?.stroke as FlutterColorStroke;
    _minuteStroke = _minuteShape?.stroke as FlutterColorStroke;
    _secondStroke = _secondShape?.stroke as FlutterColorStroke;

    if (_hourShape != null) _hourStroke.uiColor = hourColor;
    if (_minuteShape != null) _minuteStroke.uiColor = minuteColor;
    if (_secondShape != null) _secondStroke.uiColor = secondColor;

    int prevHour = hour % 12 == 0 ? 11 : (hour % 12) - 1;
    int prevMinute = minute == 0 ? 59 : minute - 1;

    _hourShape = artboard.getNode('${prevHour}H');
    _minuteShape = artboard.getNode('$prevMinute');

    _hourStroke = _hourShape?.stroke as FlutterColorStroke;
    _minuteStroke = _minuteShape?.stroke as FlutterColorStroke;

    if (_hourShape != null)
      _hourStroke.uiColor = Color.fromRGBO(108, 108, 108, 1);

    if (_minuteShape != null)
      _minuteStroke.uiColor = Color.fromRGBO(108, 108, 108, 1);

    seconds = seconds % 60 == 0 ? 0 : seconds;

    _actor.apply(seconds.toDouble(), artboard, 1.0);
    return true;
  }
}
