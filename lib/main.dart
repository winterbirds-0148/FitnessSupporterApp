import 'dart:io';

import 'package:fitnesssupporter/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  // Hive 초기화
  var path = Directory.current.path;
  Hive.init(path);

  // 앱 실행
  runApp(const FitnessSupporter());
}

class FitnessSupporter extends StatelessWidget {
  const FitnessSupporter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            labelTextStyle: WidgetStateProperty.all(
              GoogleFonts.notoSansKr(
                color: const Color(0xFF181818),
                fontWeight: FontWeight.w600,
              ),
            ),
            indicatorColor: Colors.black),
        textTheme: GoogleFonts.notoSansKrTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF181818),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: const Color(0xFF181818),
          ),
        ),
      ),
      home: const NavigatorWidget(),
    );
  }
}
