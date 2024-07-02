import 'package:fitnesssupporter/screens/edit_screen.dart';
import 'package:fitnesssupporter/screens/history_screen.dart';
import 'package:fitnesssupporter/screens/home_screen.dart';
import 'package:fitnesssupporter/screens/test_timer.dart';
import 'package:fitnesssupporter/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 70,
        elevation: 10,
        shadowColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              color: Colors.white,
              Icons.fitness_center_rounded,
              size: 30,
            ),
            icon: Icon(
              color: Color(0xFF181818),
              Icons.fitness_center_rounded,
              size: 30,
            ),
            label: '오늘의 운동',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              color: Colors.white,
              Icons.calendar_month,
              size: 30,
            ),
            icon: Icon(
              color: Color(0xFF181818),
              Icons.calendar_month,
              size: 30,
            ),
            label: '운동 기록',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              color: Colors.white,
              Icons.edit_note,
              size: 30,
            ),
            icon: Icon(
              color: Color(0xFF181818),
              Icons.edit_note,
              size: 30,
            ),
            label: '운동/루틴 편집',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              color: Colors.white,
              Icons.timer,
              size: 30,
            ),
            icon: Icon(
              color: Color(0xFF181818),
              Icons.timer,
              size: 30,
            ),
            label: '휴식 타이머',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const HistoryScreen(),
        const EditScreen(),
        const TimerScreen(),
      ][currentPageIndex],
    );
  }
}
