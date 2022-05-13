import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CurrentBmi extends StatelessWidget {
  // final double height;
  // final double weight;
  final double bmi;

  //const CurrentBmi({required this.height, required this.weight});
  const CurrentBmi({required this.bmi});

  //double bmi = weight / pow(height / 100, 2);

  @override
  Widget build(BuildContext context) {
    Recommand recommand = Recommand();
    double bmi_text = recommand.bmi_textform(bmi);
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/TitleLogo.png',
            width: 500.0,
            height: 150.0,
          ),
          backgroundColor: Color.fromARGB(255, 18, 79, 130),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '당신의 BMI는 $bmi_text입니다',
                  style: GoogleFonts.lato(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  recommand.recommand_message(bmi),
                  style: GoogleFonts.lato(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class Recommand {
  // final double bmi;
  // Recommand({required this.bmi});

  String recommand_message(double bmi) {
    if (bmi <= 18.5) {
      return "저체중입니다";
    } else if (bmi > 18.5 && bmi <= 23) {
      return "정상입니다";
    } else if (bmi > 23 && bmi <= 25) {
      return "과체중입니다";
    } else if (bmi > 25 && bmi <= 30) {
      return "비만입니다";
    } else {
      return "고도비만입니다";
    }
  }

  double bmi_textform(double bmi) {
    return double.parse(bmi.toStringAsFixed(2));
  }
}
