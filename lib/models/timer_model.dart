import 'package:flutter/material.dart';

class TimerModel {
  final int defaultSeconds;
  final String displayText;

  TimerModel.newTimer(int seconds)
      : defaultSeconds = seconds,
        displayText = '$seconds초';

  IconButton getTimerButton(var onPressedFunction) {
    return IconButton(
      onPressed: onPressedFunction,
      icon: const Icon(Icons.timer_sharp),
      tooltip: displayText,
    );
  }
}
