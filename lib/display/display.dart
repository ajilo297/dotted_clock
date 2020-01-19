library display;

import 'package:flutter/material.dart';

part 'time_display.dart';

class _Display extends StatelessWidget {
  final Color color;
  final double size;
  final List<int> displayArray;

  _Display({
    this.size = 5,
    this.displayArray = const [1, 2, 3, 4, 5, 6, 7],
    this.color,
  });

  factory _Display.one({Color color}) {
    return _Display(
      displayArray: [3, 6],
      color: color,
    );
  }

  factory _Display.two({Color color}) {
    return _Display(
      displayArray: [1, 3, 4, 5, 7],
      color: color,
    );
  }

  factory _Display.three({Color color}) {
    return _Display(
      displayArray: [1, 3, 4, 6, 7],
      color: color,
    );
  }

  factory _Display.four({Color color}) {
    return _Display(
      displayArray: [2, 3, 4, 6],
      color: color,
    );
  }

  factory _Display.five({Color color}) {
    return _Display(
      displayArray: [1, 2, 4, 6, 7],
      color: color,
    );
  }

  factory _Display.six({Color color}) {
    return _Display(
      displayArray: [1, 2, 4, 5, 6, 7],
      color: color,
    );
  }

  factory _Display.seven({Color color}) {
    return _Display(
      displayArray: [1, 3, 6],
      color: color,
    );
  }

  factory _Display.eight({Color color}) {
    return _Display(
      displayArray: [1, 2, 3, 4, 5, 6, 7],
      color: color,
    );
  }

  factory _Display.nine({Color color}) {
    return _Display(
      displayArray: [1, 2, 3, 4, 6, 7],
      color: color,
    );
  }

  factory _Display.zero({Color color}) {
    return _Display(
      displayArray: [1, 2, 3, 5, 6, 7],
      color: color,
    );
  }

  factory _Display.off({Color color}) {
    return _Display(
      displayArray: [],
      color: color,
    );
  }

  factory _Display.p({Color color}) {
    return _Display(
      displayArray: [1, 2, 3, 4, 5],
      color: color,
    );
  }

  factory _Display.a({Color color}) {
    return _Display(
      displayArray: [1, 2, 3, 4, 5, 6],
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 4,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              gap,
              Expanded(
                child: displayArray.contains(1) ? blockActive : blockInactive,
              ),
              gap,
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: displayArray.contains(2)
                          ? blockActive
                          : blockInactive,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: displayArray.contains(3)
                          ? blockActive
                          : blockInactive,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              gap,
              Expanded(
                child: displayArray.contains(4) ? blockActive : blockInactive,
              ),
              gap,
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: displayArray.contains(5)
                          ? blockActive
                          : blockInactive,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: displayArray.contains(6)
                          ? blockActive
                          : blockInactive,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              gap,
              Expanded(
                child: displayArray.contains(7) ? blockActive : blockInactive,
              ),
              gap,
            ],
          ),
        ],
      ),
    );
  }

  Gap get gap => Gap(size: size);

  Block get blockActive => Block(
        true,
        height: size,
        width: size,
        color: color,
      );

  Block get blockInactive => Block(
        false,
        height: size,
        width: size,
        color: color,
      );
}

class Gap extends StatelessWidget {
  final double size;

  Gap({this.size = 10});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
    );
  }
}

class Block extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  final bool active;

  Block(
    this.active, {
    this.height = 10,
    this.width = 10,
    Color color,
  }) : this.color = color ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: !active ? color.withAlpha(10) : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Size(width, height).shortestSide / 2,
          ),
        ),
      ),
    );
  }
}
