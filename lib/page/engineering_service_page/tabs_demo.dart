import 'package:FUS/router/router_config.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/list_view_item.dart';
import 'package:flutter/material.dart';



class TabsDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<ListItemModel> _list = [
      ListItemModel('Tab1', () => RouterConfig.toPage(context, 'tab1', arguments: '1111')),
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

