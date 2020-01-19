part of clock;

class InheritedClock extends InheritedWidget {
  final ClockModel clockModel;

  InheritedClock({
    Key key,
    @required this.clockModel,
    @required Widget child,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedClock oldWidget) {
    return true;
  }

  static InheritedClock of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: InheritedClock);
  }
}
