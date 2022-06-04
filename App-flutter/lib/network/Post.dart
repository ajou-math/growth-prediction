import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  String? childId;
  String? childPw;
  String? body;
  String? body_new;
  String? newPw;

  var loginUrl =
      Uri.parse('http://3.34.248.86:8080/growthprediction/child-login');
  var changePwUrl =
      Uri.parse('http://3.34.248.86:8080/growthprediction/child-changepw');
  Map<String, String> headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
  };

  void setChild(String childId, String childPw) {
    this.childId = childId;
    this.childPw = childPw;
    body = jsonEncode({
      'childid': childId,
      'childpw': childPw,
    });
  }

  void setNew(String newPw) {
    this.newPw = newPw;
    body_new = jsonEncode({
      'childid': childId,
      'childpw': newPw,
    });
  }

  Future<http.Response> sendPost() async {
    return (await http.post(
      loginUrl,
      body: body,
      headers: headers,
    ));
  }

  Future<http.Response> sendPostNew() async {
    return (await http.post(
      changePwUrl,
      body: body_new,
      headers: headers,
    ));
  }
}
