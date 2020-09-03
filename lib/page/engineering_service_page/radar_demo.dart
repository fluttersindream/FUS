import 'package:FUS/widget/radar_view.dart';
import 'package:FUS/config/style.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class RadarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.black,
      appBar: AppBarWidget(
        '雷达',
        context,
        backgroundColor: Style.black,
        showBackBtn: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            left: 10,
            right: 10,
            child: Center(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: RadarView(),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('assets/asscre.png'),
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(.5),
                              blurRadius: 5.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
