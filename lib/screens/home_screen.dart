import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('이것은 홈 스크린 입니다',
          style: GoogleFonts.jua(
            color: Colors.black,
            fontSize: 30,
          )),
    );
  }
}
