import 'package:http/http.dart' as http;

String ipAddress = 'http://3.34.248.86:8080';

class GetComm {
  String childName = '';
  void setChildName(String childName) {
    this.childName = childName;
  }

  String url = ipAddress + '/growthprediction/child/';
  Future<http.Response> sendGet() async {
    return (await http.get(
      Uri.parse(url + childName),
    ));
  }

  Future<http.Response> sendGetRec() async {
    return (await http.get(
      Uri.parse(url + childName + '/recommend'),
    ));
  }

  Future<http.Response> sendGetCount() async {
    return (await http.get(
      Uri.parse(url + childName + '/privacycount'),
    ));
  }

  Future<http.Response> sendGetPriv() async {
    return (await http.get(
      Uri.parse(url + childName + '/privacy'),
    ));
  }
}
