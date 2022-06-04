import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExResultSep extends StatefulWidget {
  const ExResultSep(
      {Key? key,
      required this.childName,
      required this.childNumber,
      required this.parentName,
      required this.parentNumber,
      required this.index,
      required this.recJson,
      required this.privJson})
      : super(key: key);
  final String childName;
  final String childNumber;
  final String parentName;
  final String parentNumber;
  final int index;
  final dynamic recJson;
  final dynamic privJson;

  @override
  State<ExResultSep> createState() => _ExResultSepState();
}

class _ExResultSepState extends State<ExResultSep> {
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
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 18, 79, 130),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/icons/${widget.privJson[widget.index]['privacygender']}.png'),
                radius: 60,
                backgroundColor: Colors.grey,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              widget.childName,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '나이 ${int.parse(DateFormat('yy').format(DateTime.parse(widget.privJson[0]['privacyenterday']))) - (int.parse(widget.privJson[0]['privacybirth'].substring(0, 2))) + 1}세',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '신장 ${widget.privJson[widget.index]['privacytall']} cm',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '체중 ${widget.privJson[widget.index]['privacyweight']} kg',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '골연령 ${widget.privJson[widget.index]['privacybornage']}세',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '예상 신장 ${widget.privJson[widget.index]['privacypredicttall']} cm',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '종합소견',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.recJson[widget.index]['recommendwalk']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.recJson[widget.index]['recommendworkout']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.recJson[widget.index]['recommendsleep']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.recJson[widget.index]['recommendcomment']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
