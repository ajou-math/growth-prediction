import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile/login/firstlogin.dart';
import 'package:mobile/login/palette.dart';
import 'package:mobile/network/GetComm.dart';
import 'package:mobile/network/Post.dart';
import 'package:mobile/page/home.dart';
import 'package:get/get.dart' as g;
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _formKey = GlobalKey<FormState>();

  Post post = Post();
  String id = '';
  String pw = '';
  http.Response? response;

  Map<String, String> headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
  };
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ),
            //배경
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20.0),
                height: 280.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Palette.activeColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: '아이디를 입력하세요',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                              onSaved: (value) {
                                setState(() {
                                  id = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: '비밀번호를 입력하세요',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                              obscureText: true,
                              onSaved: (value) {
                                setState(() {
                                  pw = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //텍스트 폼 필드
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 400,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          post.setChild(id, pw);
                          response = await post.sendPost();
                          print(response!.body);
                          if (response!.statusCode == 200) {
                            if (response!.body == "changepw") {
                              g.Get.to(() => FirstLogin(
                                    id: id,
                                    oldPw: pw,
                                  ));
                            } else if (response!.body == "login") {
                              GetComm getcomm = GetComm();
                              getcomm.setChildName(id);
                              http.Response responseChild =
                                  await getcomm.sendGet();
                              String childName = jsonDecode(utf8.decode(
                                  responseChild.bodyBytes))['childname'];
                              String childNumber =
                                  jsonDecode(responseChild.body)['childnumber'];
                              String parentName = jsonDecode(utf8.decode(
                                  responseChild.bodyBytes))['childparentname'];
                              String parentNumber = jsonDecode(
                                  responseChild.body)['childparentnumber'];
                              http.Response responseCount =
                                  await getcomm.sendGetCount();
                              int reportCount = jsonDecode(responseCount.body);
                              http.Response responsePriv =
                                  await getcomm.sendGetPriv();
                              var privJson = jsonDecode(
                                  utf8.decode(responsePriv.bodyBytes));
                              http.Response responseRec =
                                  await getcomm.sendGetRec();
                              var recJson = jsonDecode(
                                  utf8.decode(responseRec.bodyBytes));

                              g.Get.to(
                                () => MyHome(
                                  childId: id,
                                  childName: childName,
                                  childNumber: childNumber,
                                  parentName: parentName,
                                  parentNumber: parentNumber,
                                  reportCount: reportCount,
                                  recJson: recJson,
                                  privJson: privJson,
                                ),
                              );
                            } else if (response!.body == "iderror" ||
                                response!.body == "error") {
                              g.Get.snackbar(
                                '알림',
                                '아이디, 비밀번호를 확인하세요',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor:
                                    Color.fromARGB(255, 202, 202, 202),
                                duration: Duration(milliseconds: 1000),
                              );
                            }
                          } else {
                            print("statusCode is not 200!!!!!!!");
                            //todo
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 200,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/TitleLogo.png',
                    width: 500.0,
                    height: 150.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
