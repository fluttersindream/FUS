import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'home_pege.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1334);
    return HomePage();
  }
}
