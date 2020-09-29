import 'package:FUS/page/commom/record_widget/record_widget.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * @Descripttion:
 * @version:
 * @Author: Asscre
 * @Date: 2020-09-24 11:44:44
 * @LastEditors: Asscre
 * @LastEditTime: 2020-09-24 11:44:44
 */
class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  String fileName;

  @override
  void initState() {
    super.initState();
    fileName = '还未有数据';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('语音', context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _fileName(),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _fileName() {
    return Text(fileName);
  }

  Widget _button(BuildContext ctx) {
    return FlatButton(
      onPressed: () async {
        var file = await recordWidget(ctx);
        print(file);
        if (file != null) {
          setState(() {
            fileName = file.fileName;
          });
        }
      },
      child: Text(
        '录音',
        style: TextStyle(fontSize: sp(48)),
      ),
    );
  }
}
