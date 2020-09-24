import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/*
 * @Descripttion:
 * @version:
 * @Author: Asscre
 * @Date: 2020-09-24 11:44:44
 * @LastEditors: Asscre
 * @LastEditTime: 2020-09-24 11:44:44
 */
enum AudioState {
  /// 音频播放中
  isPlaying,

  /// 音频播放中暂停播放
  // isPaused,
  /// 音频播放停止
  isStopped,

  /// 等待录制
  isWaiteRecord,

  /// 录制中
  isRecording,

  /// 录制中暂停
  isRecordingPaused,

  /// 录制完毕
  isRecordingStopped,
}

class RecordWidgetProvider with ChangeNotifier {
  /// 音频地址
  String filePath;

  /// 音频名称
  String fileName = '';

  /// 本地地址
  String appDocPath;

  /// 音频时长
  int dbLevel;

  /// 时间
  String recorderTxt = '00:00:00';

  /// 音频状态
  AudioState audioState = AudioState.isWaiteRecord;

  /// 音频流控制
  StreamSubscription _recorderSubscription;
  StreamSubscription _playerSubscription;

  /// 实例化
  FlutterSoundPlayer _flutterSoundPlayer;
  FlutterSoundRecorder _flutterSoundRecorder;

  RecordWidgetProvider() {
    _flutterSoundPlayer = FlutterSoundPlayer();
    _flutterSoundRecorder = FlutterSoundRecorder();
    init();
  }

  Future<void> _initializeExample(bool withUI) async {
    await _flutterSoundPlayer.closeAudioSession();

    await _flutterSoundPlayer.openAudioSession(
        focus: AudioFocus.requestFocusTransient);

    /// 设置player和recorder的listen跟踪刷新时间
    await _flutterSoundPlayer
        .setSubscriptionDuration(Duration(milliseconds: 200));
    await _flutterSoundRecorder
        .setSubscriptionDuration(Duration(milliseconds: 200));
  }

  Future<void> init() async {
    _flutterSoundRecorder.openAudioSession(
        focus: AudioFocus.requestFocusTransient,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await _initializeExample(false);
  }

  @override
  void dispose() {
    _cancelRecorderSubscriptions();
    _cancelPlayerSubscriptions();
    _releaseFlauto();
    super.dispose();
  }

  /// 释放录音流
  void _cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription.cancel();
      _recorderSubscription = null;
    }
  }

  /// 释放语音播放
  void _cancelPlayerSubscriptions() {
    if (_playerSubscription != null) {
      _playerSubscription.cancel();
      _playerSubscription = null;
    }
  }

  /// 释放内存FlutterSound
  Future<void> _releaseFlauto() async {
    try {
      await _flutterSoundPlayer.closeAudioSession();
      await _flutterSoundRecorder.closeAudioSession();
    } catch (e) {
      print('Released unsuccessful');
      print(e);
    }
  }

  /// 播放语音
  void playVoice() async {
    try {
      if (await _fileExists(filePath)) {
        await _flutterSoundPlayer.startPlayer(
          fromURI: filePath,
          whenFinished: () {
            print('==> 结束播放');
            stopPlayVoice();
          },
        );
        audioState = AudioState.isPlaying;
        notifyListeners();

        _cancelPlayerSubscriptions();
        _playerSubscription = _flutterSoundPlayer.onProgress.listen((e) {
          if (e != null && e.duration != null) {
            DateTime date = new DateTime.fromMillisecondsSinceEpoch(
              e.duration.inMilliseconds,
              isUtc: true,
            );
            dbLevel = date.second;
            DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
            DateTime dateTime = inputFormat.parse(date.toString());
            DateFormat outputFormat = DateFormat("HH:mm:ss");
            String dateInString = outputFormat.format(dateTime);
            recorderTxt = dateInString;
            print(recorderTxt);
            notifyListeners();
          }
        });
      } else {
        EasyLoading.showToast("未找到文件路径");
        throw RecordingPermissionException("未找到文件路径");
      }
    } catch (err) {
      audioState = AudioState.isRecordingStopped;
      notifyListeners();
      print('==> 错误: $err');
    }
  }

  /// 暂停播放
  void stopPlayVoice() async {
    if (_flutterSoundPlayer.isStopped) {
      await _flutterSoundPlayer.stopPlayer();
      audioState = AudioState.isRecordingStopped;
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }
      notifyListeners();
    }
  }

  /// 开始录音
  void startRecord() async {
    try {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        EasyLoading.showToast("未获取到麦克风权限");
        throw RecordingPermissionException("未获取到麦克风权限");
      }
      if (!_flutterSoundRecorder.isRecording) {
        audioState = AudioState.isRecording;
        // 生成文件名
        Directory tempDir = await getTemporaryDirectory();
        var time = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        filePath =
            '${tempDir.path}/${_flutterSoundRecorder.slotNo}-$time${ext[Codec.aacADTS.index]}';
        fileName = filePath;
        print(fileName);
        await _flutterSoundRecorder.startRecorder(toFile: filePath);
        print('startRecorder');

        _recorderSubscription = _flutterSoundRecorder.onProgress.listen((e) {
          if (e != null && e.duration != null) {
            DateTime date = new DateTime.fromMillisecondsSinceEpoch(
              e.duration.inMilliseconds,
              isUtc: true,
            );
            dbLevel = date.second;
            DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
            DateTime dateTime = inputFormat.parse(date.toString());
            DateFormat outputFormat = DateFormat("HH:mm:ss");
            String dateInString = outputFormat.format(dateTime);
            recorderTxt = dateInString;
            print(recorderTxt);
            notifyListeners();
          }
        });
        notifyListeners();
      }
    } catch (e) {
      print(e);
      if (!_flutterSoundRecorder.isStopped) {
        stopRecord();
        audioState = AudioState.isWaiteRecord;
        if (_recorderSubscription != null) {
          _recorderSubscription.cancel();
          _recorderSubscription = null;
        }
      }
    }
  }

  /// 暂停录音
  void pausedRecord() async {
    if (_flutterSoundRecorder.isRecording) {
      audioState = AudioState.isRecordingPaused;
      await _flutterSoundRecorder.pauseRecorder();
      notifyListeners();
    }
  }

  /// 继续录音
  void continueRecord() async {
    if (_flutterSoundRecorder.isPaused) {
      audioState = AudioState.isRecording;
      await _flutterSoundRecorder.resumeRecorder();
      notifyListeners();
    }
  }

  /// 停止录音
  void stopRecord() async {
    print(filePath);
    if (!_flutterSoundRecorder.isStopped) {
      audioState = AudioState.isRecordingStopped;
      await _flutterSoundRecorder.stopRecorder();
      notifyListeners();
    }
  }

  /// 保存录音
  void sendRecord(BuildContext context) {
    Navigator.pop(context, AudioFile(fileName, filePath, dbLevel));
    Future.delayed(Duration(milliseconds: 200), () {
      audioState = AudioState.isWaiteRecord;
      notifyListeners();
    });
  }

  /// 取消录音
  void cancelRecord(BuildContext context) {
    if (File(filePath).existsSync()) {
      File(filePath).delete();
    }
    Navigator.pop(context);
    Future.delayed(Duration(milliseconds: 200), () {
      audioState = AudioState.isWaiteRecord;
      notifyListeners();
    });
  }

  /// 判断文件是否存在
  Future<bool> _fileExists(String path) async {
    return await File(path).exists();
  }
}

class AudioFile {
  final String fileName;
  final String fileUri;
  final int duration;

  AudioFile(this.fileName, this.fileUri, this.duration);
}
