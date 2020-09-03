import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:flutter/material.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
/// 说明Widget用于阐述项目详情
class ExplainWidget extends StatelessWidget {
  final String txt;
  final Color backgroundColor;
  final TextStyle textStyle;

  ExplainWidget(this.txt, {this.backgroundColor = Style.grey, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sw(12)),
      margin: EdgeInsets.all(sw(10)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(sw(20)),
      ),
      child: Text(
        txt,
        style: textStyle ?? TextStyle(
          color: Style.black,
          fontSize: sp(28)
        ),
      ),
    );
  }
}
