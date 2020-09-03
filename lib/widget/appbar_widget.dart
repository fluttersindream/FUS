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
    this.backgroundColor = Style.red,
    this.titleStyle,
    this.showBackBtn = true,
  })  : assert(title != null, 'title为必传项'),
        assert(context != null, 'context为必传项');

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, sh(80));

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
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
}
