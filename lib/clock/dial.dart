part of clock;

class Dial extends StatefulWidget {
  @override
  _DialState createState() => _DialState();
}

class _DialState extends State<Dial> {
  ClockModel clockModel;

  Color secondColor;
  Color minuteColor;
  Color hourColor;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 2), (_) {
      setState(() {});
    });
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    clockModel = InheritedClock.of(context).clockModel;
    secondColor = Theme.of(context).primaryColor;
    minuteColor = Theme.of(context).primaryColorDark;
    hourColor = Theme.of(context).accentColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          buildHourDots(),
          buildMinuteDots(),
          buildSecondsDots(),
          Positioned.fill(
            child: Center(
              child: FractionallySizedBox(
                heightFactor: 1 / 6,
                child: Transform(
                  transform: Matrix4.skew(-0.13, 0),
                  child: TimeDisplay(
                    hourString,
                    DateTime.now().minute.toString(),
                    is24Hour: clockModel.is24HourFormat,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get hourString {
    if (clockModel.is24HourFormat) {
      return DateTime.now().hour.toString();
    }
    int hour = DateTime.now().hour;
    if (hour > 12) return (hour - 12).toString();
    return hour.toString();
  }

  Widget buildHourDots() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: List.generate(
          60,
          (value) => buildHour(value),
        ).toList(),
      ),
    );
  }

  Widget buildMinuteDots() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: List.generate(
          60,
          (value) => buildMinute(value),
        ).toList(),
      ),
    );
  }

  Widget buildSecondsDots() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        children: List.generate(
          60,
          (value) => buildSecond(value),
        ).toList(),
      ),
    );
  }

  Widget buildHour(int hour) {
    return Positioned.fill(
      child: Transform.rotate(
        angle: (2 * math.pi * hour) / 12,
        child: Column(
          children: <Widget>[
            HourDot(
              color: () {
                int dateHour = DateTime.now().hour;
                if (dateHour > 12) dateHour -= 12;
                if (dateHour >= hour) return hourColor;
                return hourColor.withAlpha(10);
              }(),
              size: isCurrentHour(hour) ? 10 : 8,
              shadows: (isCurrentHour(hour)) ? [buildBoxShadow] : [],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildMinute(int minute) {
    return Positioned.fill(
      child: Transform.rotate(
        angle: (2 * math.pi * minute) / 60,
        child: Column(
          children: <Widget>[
            MinuteDot(
              color: () {
                if (DateTime.now().minute >= minute) return minuteColor;
                return minuteColor.withAlpha(10);
              }(),
              size: isCurrentMinute(minute) ? 10 : 8,
              shadows: (isCurrentMinute(minute)) ? [buildBoxShadow] : [],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildSecond(int second) {
    return Positioned.fill(
      child: Transform.rotate(
        angle: (2 * math.pi * second) / 60,
        child: Column(
          children: <Widget>[
            SecondDot(
              isScaled: DateTime.now().second == second,
              color: () {
                if (DateTime.now().second == second)
                  return secondColor.withAlpha(10);
                if (DateTime.now().second >= second) return secondColor;
                return secondColor.withAlpha(10);
              }(),
              size: isCurrentSecond(second) ? 10 : 8,
              shadows: (isCurrentSecond(second)) ? [buildBoxShadow] : [],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  BoxShadow get buildBoxShadow => BoxShadow(
        color: Colors.black.withAlpha(30),
        blurRadius: 7,
        spreadRadius: 2,
        offset: Offset(0, 2),
      );

  bool isCurrentSecond(int second) {
    return DateTime.now().second == second;
  }

  bool isCurrentMinute(int minute) {
    return DateTime.now().minute == minute;
  }

  bool isCurrentHour(int hour) {
    return DateTime.now().hour == hour;
  }
}
