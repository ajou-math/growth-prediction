import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/login/login.dart';
import 'package:mobile/network/Post.dart';
import 'package:get/get.dart' as g;
import 'package:mobile/page/home.dart';

class FirstLogin extends StatefulWidget {
  const FirstLogin({Key? key, required this.oldPw, required this.id})
      : super(key: key);
  final String oldPw;
  final String id;
  @override
  State<FirstLogin> createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
  };
  String? newPw;
  Post post = Post();
  http.Response? response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icons/TitleLogo.png',
          width: 500.0,
          height: 150.0,
        ),
        backgroundColor: Color.fromARGB(255, 18, 79, 130),
      ),
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              width: 300.0,
              color: Color.fromARGB(255, 18, 79, 130),
              child: const Text(
                '\n최초 로그인시에는\n 비밀번호를 바꾸어야합니다',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 231, 233),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '아이디를 입력하세요'),
                                //keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.compareTo(widget.id) != 0) {
                                    return "아이디를 정확히 입력하세요";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '새로운 비밀번호를 입력하세요'),
                                obscureText: false,
                                validator: (value) {
                                  if (value!.compareTo(widget.oldPw) == 0) {
                                    return '이전 비밀번호랑 달라야 합니다';
                                  } else if (value.isEmpty) {
                                    return "공백입니다";
                                  } else if (value.length < 7) {
                                    return "비밀번호는 8자리 이상이여야 합니다";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    newPw = value!;
                                  });
                                },
                              ),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      post.setChild(widget.id, widget.oldPw);
                                      post.setNew(newPw!);
                                      response = await post.sendPostNew();
                                      print(response!.body);
                                      if (response!.statusCode == 200) {
                                        print("change pw over");
                                        g.Get.to(() => LoginSignupScreen());
                                      } else {
                                        print('change pw something wrong');
                                      }
                                    }
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
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
