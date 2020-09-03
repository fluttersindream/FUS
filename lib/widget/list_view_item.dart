import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class ListViewItem extends StatelessWidget {
  final ListItemModel _d;

  ListViewItem(this._d);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Style.grey, width: sp(1))),
      ),
      child: ListTile(
        onTap: () => _d.func(),
        leading: Avatar(_d.name),
        title: Text(
          _d.name,
          style: TextStyle(fontSize: Style.titleSz, color: Style.black),
        ),
        trailing: Icon(
          IconData(0xe799, fontFamily: 'iconfont'),
          size: Style.mainIconSz,
        ),
      ),
    );
  }
}

class ListItemModel {
  final String name;
  final Function func;

  ListItemModel(this.name, this.func);
}
