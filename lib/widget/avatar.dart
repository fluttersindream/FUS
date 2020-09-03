import 'dart:convert';

import 'package:FUS/pubs/screen_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  /// 预设颜色
  static const List<List<int>> rgbs = [
    [223, 81, 65],
    [69, 151, 236],
    [236, 184, 63],
    [78, 155, 74],
    [208, 215, 219],
  ];

  /// 名称
  final String name;

  /// 是否显示网络图片,默认为false，不显示
  final bool isShowNetworkImage;

  /// 头像url
  final String avatarUrl;

  /// 宽度
  final double width;

  /// 高度
  final double height;

  /// 字体大小
  final double fontSize;

  /// 圆角
  final BorderRadiusGeometry borderRadius;

  Avatar(
    this.name, {
    Key key,
    this.avatarUrl,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.isShowNetworkImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? sw(68),
      height: height ?? sw(68),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(sw(5)),
        child: isShowNetworkImage
            ? CachedNetworkImage(
                width: width ?? sw(68),
                height: height ?? sw(68),
                imageUrl: avatarUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => _diyAvatar(),
              )
            : _diyAvatar(),
      ),
    );
  }

  Widget _diyAvatar() {
    List<int> rgb = _rgbByString(name);
    return Container(
      alignment: Alignment.center,
      width: width ?? sw(68),
      height: height ?? sw(68),
      decoration: BoxDecoration(
        color: Color.fromRGBO(rgb[0], rgb[1], rgb[2], 0.3),
      ),
      child: Text(
        '${this.name.substring(0, 1)}',
        style: TextStyle(
          color: Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1),
          fontSize: fontSize,
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

    return rgbs[range % rgbs.length];
  }
}
