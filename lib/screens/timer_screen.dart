import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int defaultSeconds = 30;
  int currentSeconds = 30;
  late Timer timer;
  bool isTimerRunning = false;
  List<int> timerSettings = [30, 60, 180, 300];

  final CountDownController _controller = CountDownController();
  bool _isPaused = false;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void timerReset() {
    _controller.restart(duration: defaultSeconds);
    _controller.pause();
    _isPaused = false;
    setState(() {});
  }

  void changeTimerSetting(int seconds) {
    defaultSeconds = defaultSeconds + seconds;
    timerReset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularCountDownTimer(
                  backgroundColor: Colors.white,
                  textFormat: CountdownTextFormat.MM_SS,
                  autoStart: true,
                  controller: _controller,
                  width: 250,
                  height: 250,
                  duration: defaultSeconds,
                  initialDuration: 0,
                  fillColor: Colors.white,
                  ringColor: Colors.black,
                  isReverse: true,
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                  onComplete: () {
                    timerReset();
                  },
                  onChange: (value) {
                    if (!_isPaused) _controller.pause();
                  },
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: _isPaused ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: IconButton(
                      iconSize: _isPaused ? 0 : 50,
                      onPressed: () {
                        changeTimerSetting(-10);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_rounded,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 65,
                  onPressed: () {
                    setState(() {
                      _isPaused ? _controller.pause() : _controller.resume();
                      _isPaused = !_isPaused;
                    });
                  },
                  icon:
                      Icon(_isPaused ? Icons.pause_circle : Icons.play_circle),
                ),
                IconButton(
                  iconSize: 65,
                  onPressed: () => timerReset(),
                  icon: const Icon(Icons.replay_circle_filled),
                ),
                AnimatedOpacity(
                  opacity: _isPaused ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: IconButton(
                      iconSize: _isPaused ? 0 : 50,
                      onPressed: () {
                        changeTimerSetting(10);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    //   return Column(
    //     children: [
    //       Flexible(
    //         flex: 3,
    //         child: Container(
    //           alignment: Alignment.bottomCenter,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               const Text(
    //                 '휴식 타이머',
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   color: Colors.amber,
    //                 ),
    //               ),
    //               Text(
    //                 format(currentSeconds),
    //                 style: const TextStyle(
    //                   fontSize: 70,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       changeTimerSet(-60);
    //                     },
    //                     child: const Text('-60s',
    //                         style: TextStyle(color: Colors.amber)),
    //                   ),
    //                   const SizedBox(
    //                     width: 5,
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       changeTimerSet(-10);
    //                     },
    //                     child: const Text('-10s',
    //                         style: TextStyle(color: Colors.amber)),
    //                   ),
    //                   const SizedBox(
    //                     width: 15,
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       changeTimerSet(10);
    //                     },
    //                     child: const Text('+10s',
    //                         style: TextStyle(color: Colors.amber)),
    //                   ),
    //                   const SizedBox(
    //                     width: 5,
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       changeTimerSet(60);
    //                     },
    //                     child: const Text('+60s',
    //                         style: TextStyle(color: Colors.amber)),
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Flexible(
    //         flex: 4,
    //         child: Center(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   IconButton(
    //                     onPressed: onRefreshclicked,
    //                     icon: const Icon(
    //                       Icons.replay_circle_filled_rounded,
    //                     ),
    //                     iconSize: 100,
    //                   ),
    //                   const Text(
    //                     '초기화',
    //                     style: TextStyle(
    //                       color: Colors.amber,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   IconButton(
    //                     onPressed:
    //                         isTimerRunning ? onPauseclicked : onStartclicked,
    //                     icon: isTimerRunning
    //                         ? const Icon(Icons.pause_circle_filled)
    //                         : const Icon(Icons.play_circle_fill),
    //                     iconSize: 100,
    //                   ),
    //                   isTimerRunning
    //                       ? const Text(
    //                           '일시정지',
    //                           style: TextStyle(
    //                             color: Colors.amber,
    //                           ),
    //                         )
    //                       : const Text(
    //                           '시작',
    //                           style: TextStyle(
    //                             color: Colors.amber,
    //                           ),
    //                         ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Flexible(
    //         flex: 2,
    //         child: Container(
    //           decoration: const BoxDecoration(
    //             color: Color(0xFF333533),
    //             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //           ),
    //           child: ListView.separated(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: timerSettings.length,
    //             separatorBuilder: (context, index) {
    //               return const SizedBox(
    //                 width: 10,
    //               );
    //             },
    //             itemBuilder: (context, index) {
    //               var newTimer = timerSettings[index];

    //               if (index == timerSettings.length - 1) {
    //                 return Row(
    //                   children: [
    //                     timerSetButton(newTimer, index),
    //                     const SizedBox(
    //                       width: 20,
    //                     ),
    //                     IconButton(
    //                       iconSize: 50,
    //                       onPressed: () {
    //                         setState(() {
    //                           timerSettings.add(currentSeconds);
    //                         });
    //                       },
    //                       icon: const Icon(Icons.add_circle),
    //                     )
    //                   ],
    //                 );
    //               }
    //               return timerSetButton(newTimer, index);
    //             },
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // Column timerSetButton(int newTimer, int index) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       IconButton(
    //         iconSize: 50,
    //         color: Colors.white,
    //         onPressed: () {
    //           setState(() {
    //             currentSeconds = newTimer;
    //             defaultSeconds = newTimer;
    //           });
    //         },
    //         icon: const Icon(Icons.timer_sharp),
    //       ),
    //       Text(
    //         format(newTimer),
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 16,
    //         ),
    //       ),
    //       Transform.translate(
    //         offset: const Offset(0, -10),
    //         child: IconButton(
    //           color: Colors.white,
    //           onPressed: () {
    //             setState(() {
    //               timerSettings.removeAt(index);
    //             });
    //           },
    //           icon: const Icon(Icons.disabled_by_default_rounded),
    //         ),
    //       ),
    //     ],
    //   );
  }
}
