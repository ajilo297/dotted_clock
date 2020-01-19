library weather_widget;

import 'dart:async';

import 'package:dotted_clock/clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

part '_data.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  ClockModel clockModel;

  int _index = 0;
  Timer _timer;

  List<Widget> data;
  Widget _loadedWidget;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 6), (timer) {
      if (_timer != timer) _timer = timer;
      if (_index < 4) {
        _index += 1;
      } else {
        _index = 0;
      }

      if (mounted && data != null && data.isNotEmpty)
        setState(() {
          _loadedWidget = data.elementAt(_index);
        });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    clockModel = InheritedClock.of(context).clockModel;

    data = [
      locationWidget,
      temperatureWidget,
      maxTemperatureWidget,
      minTemperatureWidget,
      dateWidget,
    ];

    setState(() {
      _loadedWidget = data.elementAt(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 900),
        child: _loadedWidget,
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.easeIn,
      ),
    );
  }

  dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get temperature => clockModel.temperatureString;

  String get weatherString => _getUpperCasedString(clockModel.weatherString);

  Widget get locationWidget {
    return _Data(
      key: ValueKey(1),
      title: _titleWidget(clockModel.location),
    );
  }

  Widget get temperatureWidget {
    return _Data(
      key: ValueKey(2),
      subtitle: _subtitleWidget(clockModel.temperatureString),
      title: _titleWidget(_getUpperCasedString(clockModel.weatherString)),
    );
  }

  Widget get maxTemperatureWidget {
    return _Data(
      key: ValueKey(3),
      title: _titleWidget(clockModel.highString),
      subtitle: _subtitleWidget('High'),
    );
  }

  Widget get minTemperatureWidget {
    return _Data(
      key: ValueKey(4),
      title: _titleWidget(clockModel.lowString),
      subtitle: _subtitleWidget('Low'),
    );
  }

  Widget get dateWidget {
    return _Data(
      key: ValueKey(5),
      title: _titleWidget(dateString),
    );
  }

  String get dateString {
    DateFormat format = DateFormat('dd MMM, yyyy');
    return format.format(DateTime.now());
  }

  String _getUpperCasedString(String input) {
    return ReCase(input).titleCase;
  }

  Text _subtitleWidget(String subtitle) {
    return Text(
      subtitle.toUpperCase(),
      style: Theme.of(context)
          .textTheme
          .subhead
          .copyWith(color: Theme.of(context).primaryColor),
    );
  }

  Text _titleWidget(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.display1.copyWith(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w100,
          ),
    );
  }
}
