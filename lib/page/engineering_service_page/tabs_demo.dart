import 'package:FUS/router/router.dart';
import 'package:FUS/page/engineering_service_page/tabs/tab1.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/list_view_item.dart';
import 'package:flutter/material.dart';

class TabsDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<ListItemModel> _list = [
      ListItemModel('Tab1', () => Navigator.pushNamed(context, 'tab1', arguments: '1111111111')),
      ListItemModel('Flutter Widget', () {}),
      ListItemModel('相机', () {}),
      ListItemModel('语音', () {}),
      ListItemModel('地图', () {}),
    ];

    return Scaffold(
      appBar: AppBarWidget(
        '自定义Tab',
        context,
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext ctx, int i) => ListViewItem(_list[i]),
      ),
    );
  }
}

