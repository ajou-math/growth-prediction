import 'package:flutter/material.dart';
import 'package:mobile/sleep/providers/clock_type_provider.dart';
import 'package:mobile/sleep/screens/components/analog_clock/analog_clock.dart';
import 'package:mobile/sleep/screens/components/digital_clock/digital_clock.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.rec}) : super(key: key);
  final String rec;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockTypeModel>(builder: (context, model, child) {
      return SafeArea(
        child: Column(
          children: [
            model.clockType == ClockType.analog
                ? const AnalogClock()
                : DigitalClock(
                    hourMinuteDigitTextStyle: TextStyle(
                      fontSize: 120,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    secondDigitTextStyle: TextStyle(
                      fontSize: 60,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                  ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              '💡$rec',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      );
    });
  }
}
