import 'dart:io';

import 'package:FUS/config/style.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterUiDetail extends StatefulWidget {
  final String title;

  FlutterUiDetail(this.title);

  @override
  _FlutterUiDetailState createState() => _FlutterUiDetailState();
}

class _FlutterUiDetailState extends State<FlutterUiDetail> {

  WebViewController _controller;
  String _title = '加载中...';

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(_title, context, backgroundColor: Style.orange,),
      body: WebView(
        initialUrl: 'https://juejin.im/post/6874737011325059086',
        /// JS执行模式 是否允许JS执行
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (e) {
          print('onPageFinished=====$e');
          _controller.evaluateJavascript("document.title").then((result){
            setState(() {
              _title = result;
            });
          }
          );
        },
        onWebViewCreated: (e) {
          _controller = e;
        },
        onPageStarted: (e) {
          print('onPageStarted=====$e');
        },
        onWebResourceError: (e) {
          print('onWebResourceError=====$e');
        },
      ),
    );
  }
}
