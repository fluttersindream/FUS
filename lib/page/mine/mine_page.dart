import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Me', context, showBackBtn: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Style.white,
        ),
        child: Column(
          children: [_title(context)],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      height: sw(120),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Asscre',
            style: TextStyle(
              fontSize: Style.titleSz,
              color: Style.black,
            ),
          )
        ],
      ),
    );
  }
}
