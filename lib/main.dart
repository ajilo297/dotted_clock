import 'package:dotted_clock/clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';

void main() async {
  runApp(
    ClockCustomizer(
      (clock) {
        return InheritedClock(
          clockModel: clock,
          child: Clock(),
        );
      },
    ),
  );
}
