import 'package:FUS/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class SoundWidgetPage extends StatefulWidget {
  @override
  _SoundWidgetPageState createState() => _SoundWidgetPageState();
}

class _SoundWidgetPageState extends State<SoundWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('语音', context),
    );
  }
}
