import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_app/services/local_storage.dart';

class Liquid extends StatefulWidget {
  const Liquid({super.key});

  @override
  State<Liquid> createState() => _LiquidState();
}

class _LiquidState extends State<Liquid> {
  double storedPercent = 0;
  String storedDate = '';

  @override
  void initState() {
    super.initState();
    checkAndSetDate();
    checkAndSetPercent();
  }

  Future<void> checkAndSetDate() async {
    String? date = LocalStorage.prefs.getString('date');
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (date == null || date != currentDate) {
      await LocalStorage.prefs.setString('date', currentDate);
      setState(() {
        storedDate = currentDate;
      });
    } else {
      setState(() {
        storedDate = date;
      });
    }
  }

  Future<void> checkAndSetPercent() async {
    double? percent = LocalStorage.prefs.getDouble('percent');

    if (percent == null) {
      await LocalStorage.prefs.setDouble('percent', 0);
      setState(() {
        storedPercent = 0;
      });
    } else {
      setState(() {
        storedPercent = percent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 10.0,
              animation: true,
              percent: storedPercent / 3000,
              center: Text(
                '$storedPercent/3000',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(45, 45, 45, 1)),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
              progressColor: const Color.fromRGBO(132, 182, 244, 1),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    storedPercent += 200;
                  });

                  await LocalStorage.prefs.setDouble('percent', storedPercent);
                },
                child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(132, 182, 244, 0.4),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(132, 182, 244, 1),
                        )),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(16),
                    child: const Row(children: [
                      Icon(
                        FontAwesomeIcons.bottleWater,
                        size: 24,
                        color: Color.fromRGBO(0, 118, 182, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '200 ml',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 118, 182, 1)),
                      )
                    ])))
          ],
        ),
      ),
    );
  }
}
