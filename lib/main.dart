import 'package:fitnesssupporter/widgets/navigator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FitnessSupporter());
}

class FitnessSupporter extends StatelessWidget {
  const FitnessSupporter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf2eedf),
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xFFf2eedf),
            labelTextStyle: WidgetStateProperty.all(
              GoogleFonts.jua(
                color: const Color(0xFF181818),
              ),
            ),
            indicatorColor: Colors.black),
        textTheme: GoogleFonts.juaTextTheme(),
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
