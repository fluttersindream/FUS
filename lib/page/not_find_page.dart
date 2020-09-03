import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class NotFindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('没有找到页面', context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/404.png',
              width: sw(300),
              height: sw(300),
            ),
          ),
          Text(
            '没有找到页面',
            style: TextStyle(
              color: Style.grey,
              fontSize: Style.titleSz,
            ),
          )
        ],
      ),
    );
  }
}
