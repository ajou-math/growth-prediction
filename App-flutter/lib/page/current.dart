import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/page/currentBmi.dart';

class Current extends StatefulWidget {
  const Current({Key? key}) : super(key: key);

  @override
  State<Current> createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  TextEditingController controller_height = TextEditingController();
  TextEditingController controller_weight = TextEditingController();
  late double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/TitleLogo.png',
          width: 500.0,
          height: 150.0,
        ),
        backgroundColor: Color.fromARGB(255, 18, 79, 130),
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                    child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: controller_height,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '현재 키를 입력하세요 (단위 : cm)'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: controller_weight,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '현재 체중을 입력하세요 (단위 : kg)'),
                          keyboardType: TextInputType.number,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CurrentBmi(
                                            bmi: double.parse(
                                                    controller_weight.text) /
                                                pow(
                                                    double.parse(
                                                            controller_height
                                                                .text) /
                                                        100,
                                                    2))),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 18, 79, 130),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
