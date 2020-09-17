import 'dart:convert';

import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final String title;
  final TextStyle titleStyle;
  final Color backgroundColor;
  final BuildContext context;
  final bool showBackBtn;

  AppBarWidget(
    this.title,
    this.context, {
    this.backgroundColor,
    this.titleStyle,
    this.showBackBtn = true,
  })  : assert(title != null, 'title为必传项'),
        assert(context != null, 'context为必传项');

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, sh(80));

  @override
  PreferredSizeWidget build(BuildContext context) {
    List<int> rgb = _rgbByString(title);
    return AppBar(
      backgroundColor: backgroundColor ?? Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1),
      centerTitle: true,
      leading: showBackBtn
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                IconData(
                  0xe7a8,
                  fontFamily: 'iconfont',
                ),
                size: sp(38),
              ),
            )
          : Container(),
      title: Text(
        title,
        style: titleStyle ??
            TextStyle(
              fontSize: sp(38),
              color: Style.white,
            ),
      ),
    );
  }

  /// 根据字符串获取颜色（十进制）
  List<int> _rgbByString(String str) {
    Utf8Encoder encode = Utf8Encoder();
    List<int> bytes = encode.convert(str);
    int range = 0;
    for (int byte in bytes) {
      range += byte;
    }

    return _rgbs[range % _rgbs.length];
  }
}

/// 预设颜色
const List<List<int>> _rgbs = [
  [223, 81, 65],
  [69, 151, 236],
  [236, 184, 63],
  [78, 155, 74],
  [208, 215, 219],
];