part of display;

class TimeDisplay extends StatelessWidget {
  final String hour;
  final String minute;

  final bool is24Hour;

  TimeDisplay(this.hour, this.minute, {this.is24Hour = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              ...displayWidget(context, hour),
              SizedBox(width: 24),
              ...displayWidget(context, minute),
              if (!is24Hour) SizedBox(width: 24),
              if (!is24Hour)
                ...displayWidget(context, DateTime.now().hour < 12 ? 'A' : 'P'),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> displayWidget(BuildContext context, String value) {
    if (int.tryParse(value) != null) value = value.padLeft(2, '0');
    return value
        .split('')
        .map((value) {
          if (value == '1') {
            return _Display.one(color: Theme.of(context).primaryColor);
          }
          if (value == '2') {
            return _Display.two(color: Theme.of(context).primaryColor);
          }
          if (value == '3') {
            return _Display.three(color: Theme.of(context).primaryColor);
          }
          if (value == '4') {
            return _Display.four(color: Theme.of(context).primaryColor);
          }
          if (value == '5') {
            return _Display.five(color: Theme.of(context).primaryColor);
          }
          if (value == '6') {
            return _Display.six(color: Theme.of(context).primaryColor);
          }
          if (value == '7') {
            return _Display.seven(color: Theme.of(context).primaryColor);
          }
          if (value == '8') {
            return _Display.eight(color: Theme.of(context).primaryColor);
          }
          if (value == '9') {
            return _Display.nine(color: Theme.of(context).primaryColor);
          }
          if (value == '0') {
            return _Display.zero(color: Theme.of(context).primaryColor);
          }
          if (value.toLowerCase() == 'a') {
            return _Display.a(color: Theme.of(context).primaryColor);
          }
          if (value.toLowerCase() == 'p') {
            return _Display.p(color: Theme.of(context).primaryColor);
          }
          return _Display.off();
        })
        .map(
          (value) => Padding(
            padding: EdgeInsets.all(2),
            child: value,
          ),
        )
        .toList();
  }
}
