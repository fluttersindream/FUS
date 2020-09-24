import 'package:FUS/page/commom/record_widget/record_widget_provider.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
 * @Descripttion:
 * @version:
 * @Author: Asscre
 * @Date: 2020-09-24 11:44:44
 * @LastEditors: Asscre
 * @LastEditTime: 2020-09-24 11:44:44
 */
Future<AudioFile> recordWidget(BuildContext ctx) async => showCupertinoDialog(
      context: ctx,
      builder: (_) => ChangeNotifierProvider(
          create: (_) => RecordWidgetProvider(),
          builder: (BuildContext ctx, Widget child) {
            print('RecordWidgetProvider build');
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: sw(333),
                  width: sw(750),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(sw(15)),
                        topRight: Radius.circular(sw(15)),
                      )),
                  child: _showWho(ctx),
                ),
              ),
            );
          }),
    );

Widget _showWho(BuildContext ctx) {
  AudioState _audioState = ctx.watch<RecordWidgetProvider>().audioState;
  final Map<AudioState, Widget> _l = {
    /// 音频播放中
    AudioState.isPlaying: _haveAudioFile(ctx),

    /// 音频播放停止
    AudioState.isStopped: _haveAudioFile(ctx),

    /// 等待录制
    AudioState.isWaiteRecord: _startRecord(ctx),

    /// 录制中
    AudioState.isRecording: _recording(ctx),

    /// 录制中暂停
    AudioState.isRecordingPaused: _recording(ctx),

    /// 录制完毕
    AudioState.isRecordingStopped: _haveAudioFile(ctx),
  };
  return _l[_audioState];
}

Widget _startRecord(BuildContext ctx) {
  return Column(
    children: [
      SizedBox(height: sw(25)),
      Text(
        '点击开始录音',
        style: TextStyle(
          fontSize: sp(30),
        ),
      ),
      SizedBox(height: sw(25)),
      GestureDetector(
        onTap: () => ctx.read<RecordWidgetProvider>().startRecord(),
        child: Container(
          width: sw(128),
          height: sw(128),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(sw(64))),
          child: Container(
            width: sw(92),
            height: sw(92),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(sw(46))),
          ),
        ),
      ),
    ],
  );
}

Widget _recording(BuildContext ctx) {
  AudioState _audioState = ctx.watch<RecordWidgetProvider>().audioState;
  bool isRecordingPaused = _audioState == AudioState.isRecordingPaused;
  return Column(
    children: [
      SizedBox(height: sw(25)),
      Text(
        ctx.watch<RecordWidgetProvider>().recorderTxt,
        style: TextStyle(fontSize: sp(30)),
      ),
      SizedBox(height: sw(25)),
      Container(
        width: sw(128),
        height: sw(128),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(sw(64))),
        child: Icon(
          IconData(isRecordingPaused ? 0xe642 : 0xe645, fontFamily: 'iconfont'),
          size: sp(36),
          color: Colors.white,
        ),
      ),
      SizedBox(height: sw(25)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: sw(32)),
          Container(
            width: sw(322),
            height: sw(64),
            child: FlatButton(
                color: Colors.blue,
                onPressed: () {
                  isRecordingPaused
                      ? ctx.read<RecordWidgetProvider>().continueRecord()
                      : ctx.read<RecordWidgetProvider>().pausedRecord();
                },
                child: Text(
                  isRecordingPaused ? '继续' : '暂停',
                  style: TextStyle(fontSize: sp(30), color: Colors.white),
                )),
          ),
          SizedBox(width: sw(12)),
          Container(
            width: sw(322),
            height: sw(64),
            child: FlatButton(
                color: Colors.red,
                onPressed: () => ctx.read<RecordWidgetProvider>().stopRecord(),
                child: Text(
                  '结束录音',
                  style: TextStyle(fontSize: sp(30), color: Colors.white),
                )),
          ),
          SizedBox(width: sw(32)),
        ],
      ),
    ],
  );
}

Widget _haveAudioFile(BuildContext ctx) {
  AudioState _audioState = ctx.watch<RecordWidgetProvider>().audioState;
  bool isRecordingStopped = _audioState == AudioState.isRecordingStopped;
  return Column(
    children: [
      SizedBox(height: sw(25)),
      Text(
        ctx.watch<RecordWidgetProvider>().recorderTxt,
        style: TextStyle(fontSize: sp(30)),
      ),
      SizedBox(height: sw(25)),
      GestureDetector(
        onTap: () => !isRecordingStopped
            ? ctx.read<RecordWidgetProvider>().stopPlayVoice()
            : ctx.read<RecordWidgetProvider>().playVoice(),
        child: Container(
          width: sw(128),
          height: sw(128),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(sw(64))),
          child: Icon(
            IconData(!isRecordingStopped ? 0xe645 : 0xe642,
                fontFamily: 'iconfont'),
            size: sp(36),
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(height: sw(25)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: sw(32)),
          Container(
            width: sw(322),
            height: sw(64),
            child: FlatButton(
                color: Colors.grey,
                onPressed: () =>
                    ctx.read<RecordWidgetProvider>().cancelRecord(ctx),
                child: Text(
                  '取消',
                  style: TextStyle(fontSize: sp(30), color: Colors.white),
                )),
          ),
          SizedBox(width: sw(12)),
          Container(
            width: sw(322),
            height: sw(64),
            child: FlatButton(
                color: Colors.blue,
                onPressed: () =>
                    ctx.read<RecordWidgetProvider>().sendRecord(ctx),
                child: Text(
                  '发送',
                  style: TextStyle(fontSize: sp(30), color: Colors.white),
                )),
          ),
          SizedBox(width: sw(32)),
        ],
      ),
    ],
  );
}
