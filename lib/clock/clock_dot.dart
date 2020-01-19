part of clock;

class SecondDot extends StatelessWidget {
  final Color color;
  final double size;
  final List<BoxShadow> shadows;
  final bool isScaled;

  SecondDot({
    this.color = Colors.black,
    this.size = 15,
    this.shadows = const [],
    this.isScaled = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 60;
    return _Dot(
      size: size,
      width: width,
      color: color,
      isScaled: isScaled,
      bottomLeft: Radius.circular(2),
      bottomRight: Radius.circular(2),
    );
  }
}

class MinuteDot extends StatelessWidget {
  final Color color;
  final double size;
  final List<BoxShadow> shadows;

  MinuteDot({
    this.color = Colors.black,
    this.size = 15,
    this.shadows = const [],
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 60;
    return _Dot(
      size: size,
      width: width,
      color: color,
      topRight: Radius.circular(3),
      topLeft: Radius.circular(3),
    );
  }
}

class HourDot extends StatelessWidget {
  final Color color;
  final double size;
  final List<BoxShadow> shadows;

  HourDot({
    this.color = Colors.black,
    this.size = 15,
    this.shadows = const [],
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 60;
    return _Dot(
      size: size,
      width: width,
      color: color,
      bottomLeft: Radius.circular(3),
      bottomRight: Radius.circular(3),
      topLeft: Radius.circular(3),
      topRight: Radius.circular(3),
    );
  }
}

class _Dot extends StatelessWidget {
  final Radius bottomLeft;
  final Radius bottomRight;
  final Radius topLeft;
  final Radius topRight;

  const _Dot({
    Key key,
    @required this.size,
    @required this.width,
    @required this.color,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.isScaled = false,
  }) : super(key: key);

  final double size;
  final double width;
  final Color color;
  final bool isScaled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      height: size,
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: isScaled
              ? BorderSide(color: Theme.of(context).primaryColor)
              : BorderSide(
                  color: Colors.transparent,
                ),
          borderRadius: BorderRadius.only(
            bottomLeft: bottomLeft,
            bottomRight: bottomRight,
            topLeft: topLeft,
            topRight: topRight,
          ),
        ),
        color: color,
      ),
    );
  }
}
