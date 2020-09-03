import 'package:FUS/widget/avatar.dart';
import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
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
      ListItemModel('语音', () {}),
      ListItemModel('地图', () {}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.orange,
        centerTitle: true,
        elevation: 0,
        title: Text(
          '进阶学习',
          style: TextStyle(
            color: Style.white,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext ctx, int i) => ListViewItem(_list[i]),
      ),
    );
  }
}
