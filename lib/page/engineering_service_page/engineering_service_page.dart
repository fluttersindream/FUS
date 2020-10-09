import 'package:FUS/router/router_config.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/button_widget.dart';
import 'package:flutter/material.dart';

class EngineeringServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBarWidget(
        'Up Up Up',
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
      ButtonModel(() => RouterConfig.toPage(context, 'ProviderPage'), 'Provider使用说明'),
      ButtonModel(() => RouterConfig.toPage(context, 'WaterRippleDemo'), '水涟漪'),
      ButtonModel(() => RouterConfig.toPage(context, 'RadarDemo'), '雷达扫描'),
      ButtonModel(() => RouterConfig.toPage(context, 'TabsDemo'), '自定义Tab'),
    ];

    List<Widget> l = [];

    _btn.forEach((item) => l.add(ButtonWidget(item)));
    return l;
  }

  // Route _toPage(Widget router) {
  //   return MaterialPageRoute(
  //     builder: (context) => router,
  //   );
  // }
}
