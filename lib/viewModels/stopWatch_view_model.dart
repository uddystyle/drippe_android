import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stopWatchProvider = ChangeNotifierProvider((ref) => StopWatchModel());

class StopWatchModel extends ChangeNotifier {
  bool isStopPressed = true;
  bool isResetPressed = true;
  bool isStartPressed = true;

  String stopWatchTimeDisplay = "00:00";
  var swatch = Stopwatch();
  final duration = const Duration(seconds: 1);
  // final SoundLogic _soundLogic = SoundLogic();
  // List<Alarm> alarmList = [];

  // Future<void> reBuild() async {
  //   alarmList = await AlarmProvider.getData();
  // }

  void startTimer() {
    Timer(duration, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    // reBuild();
    // _soundLogic.load;
    stopWatchTimeDisplay =
        "${(swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
    // ringAlarm();
    notifyListeners();
  }

  void startStopWatch() {
    isStopPressed = false;
    isStartPressed = true;
    swatch.start();
    startTimer();
    notifyListeners();
  }

  void stopStopWatch() {
    isStopPressed = true;
    isResetPressed = false;
    swatch.stop();
    notifyListeners();
  }

  void resetStopWatch() {
    isResetPressed = true;
    isStartPressed = true;
    swatch.reset();
    stopWatchTimeDisplay = "00:00";
    notifyListeners();
  }

  // ringAlarm() {
  //   alarmList.forEach((element) {
  //     String alarm = AlarmProvider.stringDuration(element.alarmTime);
  //     if (element.isActive) {
  //       if (alarm == stopWatchTimeDisplay) {
  //         _soundLogic.playSound();
  //       }
  //     }
  //   });
  // }
}