import 'package:FUS/widget/water_ripple.dart';
import 'package:FUS/config/style.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/explain_widget.dart';
import 'package:flutter/material.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
class WaterRippleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List _l = [
      {
        'color': Style.red,
        'count': 2,
      },
      {
        'color': Style.blue,
        'count': 3,
      },
      {
        'color': Style.orange,
        'count': 4,
      },
      {
        'color': Style.green,
        'count': 5,
      },
    ];

    return Scaffold(
      appBar: AppBarWidget('水涟漪', context),
      body: ListView.builder(
        itemCount: _l.length + 1,
        itemBuilder: (BuildContext _, int i) {
          if (i == _l.length) {
            return _explain();
          } else {
            return _waterRipple(
              _l[i]['count'],
              _l[i]['color'],
            );
          }
        },
      ),
    );
  }

  Widget _waterRipple(int count, Color color) {
    return Container(
      width: 100,
      height: 100,
      child: WaterRipple(
        count: count,
        color: color,
      ),
    );
  }

  Widget _explain() {
    return ExplainWidget(
      '水涟漪，可用于录音效果 \n'
      '此动画通过 CustomPainter 绘制配合 AnimationController 动画控制实现'
      '可模仿使用，学习Flutter自定义动画效果',
    );
  }
}
