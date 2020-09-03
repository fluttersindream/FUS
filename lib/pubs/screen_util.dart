import 'package:flutter_screenutil/screenutil.dart';

// 设置宽度、高度
double sw(double param) {
  return ScreenUtil().setWidth(param).toDouble();
}

// 特殊情况下设置高度的方法，正常开发中请使用sw设置高度
double sh(double param) {
  return ScreenUtil().setHeight(param).toDouble();
}

// 设置字体、icon大小
double sp(double param) {
  return ScreenUtil().setSp(param).toDouble();
}

// 设置字体、icon大小并跟随系统字体变化大小
double ssp(double param) {
  return ScreenUtil().setSp(param, allowFontScalingSelf: true).toDouble();
}