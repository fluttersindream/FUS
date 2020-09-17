import 'package:FUS/config/style.dart';
import 'package:FUS/router/router.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/list_view_item.dart';
import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {
  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  List<ListItemModel> _list = List();

  @override
  void initState() {
    super.initState();
    _list = [
      ListItemModel('Dart', () {}),
      ListItemModel('Flutter Widget', () {}),
      ListItemModel('相机', () {}),
      ListItemModel('语音', () => Router.toPage(context, 'soundWidgetPage')),
      ListItemModel('地图', () {}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Hi Flutter', context, showBackBtn: false),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext ctx, int i) => ListViewItem(_list[i]),
      ),
    );
  }
}
