import 'package:FUS/page/engineering_service_page/provider_demo.dart';
import 'package:FUS/page/engineering_service_page/water_ripple_demo.dart';
import 'package:FUS/page/not_find_page.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/button_widget.dart';
import 'package:flutter/material.dart';

import 'engineering_service_page/radar_demo.dart';
import 'engineering_service_page/tabs_demo.dart';

class EngineeringServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBarWidget(
        'Flutter学习',
        context,
        showBackBtn: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            runSpacing: 12,
            children: _setColumnChild(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _setColumnChild(BuildContext context) {
    List _btn = [
      ButtonModel(
        () => Navigator.push(
          context,
          _toPage(ProviderPage()),
        ),
        'Provider使用说明',
      ),
      ButtonModel(
        () => Navigator.push(
          context,
          _toPage(WaterRippleDemo()),
        ),
        '水涟漪',
      ),
      ButtonModel(
          () => Navigator.push(
                context,
                _toPage(RadarDemo()),
              ),
          '雷达扫描'),
      ButtonModel(
          () => Navigator.push(
                context,
                _toPage(TabsDemo()),
              ),
          '自定义Tab'),
      ButtonModel(
          () => Navigator.push(
                context,
                _toPage(NotFindPage()),
              ),
          '404'),
    ];

    List<Widget> l = [];

    _btn.forEach((item) => l.add(ButtonWidget(item)));
    return l;
  }

  Route _toPage(Widget router) {
    return MaterialPageRoute(
      builder: (context) => router,
    );
  }
}
