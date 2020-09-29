import 'dart:async';

import 'package:FUS/config/style.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class CanvasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Canvas', context),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });
    percentageAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {
              percentage = lerpDouble(percentage, newPercentage,
                  percentageAnimationController.value);
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: CustomPaint(
          foregroundPainter: MyPainter(
            lineColor: Style.grey,
            completeColor: Style.orange,
            completePercent: percentage,
            width: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Style.green,
              splashColor: Colors.transparent,
              shape: CircleBorder(),
              child: Text("Click"),
              onPressed: () => setAnimation(),
            ),
          ),
        ),
      ),
    );
  }

  void setAnimation() {
    setState(() {
      percentage = newPercentage;
      newPercentage += 10;
      if (newPercentage > 100.0) {
        percentage = 0.0;
        newPercentage = 0.0;
      }
      percentageAnimationController.forward(from: 0.0);
    });
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2); //  坐标中心
    double radius = min(size.width / 2, size.height / 2); //  半径
    canvas.drawCircle(
        //  画圆方法
        center,
        radius,
        line);

    double arcAngle = 2 * pi * (completePercent / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, //  从正上方开始
        arcAngle,
        false,
        complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
