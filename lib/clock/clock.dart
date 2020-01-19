library clock;

import 'dart:async';
import 'dart:math' as math;

import 'package:dotted_clock/display/display.dart';
import 'package:dotted_clock/weather/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

part 'clock_dot.dart';
part 'dial.dart';
part 'inherited_clock.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Theme(
      data: brightness == Brightness.dark ? _darkTheme : _lightTheme,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: brightness == Brightness.dark
            ? Color(0xff2222222)
            : Color(0xffededed),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Dial(),
            ),
            Expanded(
              child: WeatherWidget(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  ThemeData get _darkTheme {
    return ThemeData(
      accentColor: Color(0xffaa0000),
      primaryColor: Color(0xffccccee),
      primaryColorDark: Color(0xffaaaacc),
    );
  }

  ThemeData get _lightTheme {
    return ThemeData(
      accentColor: Colors.red,
      primaryColorDark: Color(0xff555588),
      primaryColor: Color(0xff8888aa),
    );
  }
}
