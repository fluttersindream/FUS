import 'dart:async';

import 'package:FUS/config/style.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class FlutterlogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('FlutterlogoPage', context),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  double _size=20.0;
  @override
  Widget build(BuildContext context) {
   return Container(
     child:Column(
       children: [
         _defaultFlog(),
         _styleLogo(),
         _durLogo()
       ],
     )

   );
  }
  Widget _defaultFlog () =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      FlutterLogo(
        colors: Colors.red,
        size: 100,
      ),
      FlutterLogo(
        colors: Colors.green,
        size: 100,
      ),
      FlutterLogo(
        colors: Colors.yellow,
        size: 100,
      ),
    ],
  );
  Widget _styleLogo() => Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "markOnly",
            style: TextStyle(color: Colors.blueAccent, fontSize: 30),
          ),
          Text(
            "horizontal",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
          ),
          Text(
            "stacked",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 30),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlutterLogo(
            size: 100,
            colors: Colors.blue,
            style: FlutterLogoStyle.markOnly,
          ),
          FlutterLogo(
            size: 100,
            colors: Colors.orange,
            style: FlutterLogoStyle.horizontal,
          ),
          FlutterLogo(
            size: 100,
            colors: Colors.purple,
            style: FlutterLogoStyle.stacked,
          ),
        ],
      ),
    ],
  );
  Widget _durLogo() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlutterLogo(
        size: _size,
        colors: Colors.blue,
        duration: Duration(seconds: 2),
        curve: Curves.easeInQuart, //控制 開始時的大小
      ),
      Container(
        width: 100,
        height: 100,
        child: RaisedButton(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Text(
            "Change\nSize",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              _size += 50;
              if (_size > 200) {
                _size = 50.0;
              }
            });
          },
          shape: CircleBorder(side: BorderSide(color: Colors.redAccent, width: 10)),
        ),
      )
    ],
  );
}

