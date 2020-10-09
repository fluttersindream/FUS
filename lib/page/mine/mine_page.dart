import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _meDetail(context),
          ],
        ),
      ),
    );
  }

  Widget _meDetail(BuildContext ctx) {
    return Container(
      height: sw(400),
      width: sw(656),
      margin: EdgeInsets.symmetric(
        vertical: sw(20),
        horizontal: sw(32),
      ),
      decoration: BoxDecoration(
        color: Style.white,
        boxShadow: [
          BoxShadow(color: Style.grey, offset: Offset(1, 1), blurRadius: sw(10))
        ],
        borderRadius: BorderRadius.circular(sw(15)),
      ),
      child: Column(
        children: [
          _img(),
          _title(ctx),
          _callMe(),
        ],
      ),
    );
  }

  Widget _img() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: sw(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(sw(100)),
        child: Image.asset(
          'assets/asscre.png',
          width: sw(200),
          height: sw(200),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: sw(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Asscre',
            style: TextStyle(
              fontSize: Style.titleSz,
              color: Style.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _callMe() {
    return Center(
      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                Expanded(child: _iconButton(0xe81f, () {})),
                Expanded(child: _iconButton(0xe60d, () {})),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconButton(int icon, Function func) {
    return GestureDetector(
      child: Icon(
        IconData(icon, fontFamily: 'iconfont'),
      ),
      onTap: func,
    );
  }
}
