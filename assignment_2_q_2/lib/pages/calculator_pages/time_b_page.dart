import 'package:flutter/material.dart';

class TimeOfDayPage extends StatefulWidget {
  const TimeOfDayPage({super.key});

  @override
  State<TimeOfDayPage> createState() => _TimeOfDayPageState();
}

class _TimeOfDayPageState extends State<TimeOfDayPage> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _convertedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Belgian Time to PKT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Column(
              children: [
                Text(
                  _time.format(context),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    _time = await showTimePicker(
                            context: context, initialTime: _time) ??
                        TimeOfDay.now();
                    setState(() {
                      _convertedTime = _convertedTime.replacing(
                        hour: (_time.hour + 4) % 24,
                        minute: _time.minute,
                      );
                    });
                  },
                  child: Text("Pick Belgian Time"),
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Time in PKT is \n",
                children: [
                  TextSpan(
                    text: _convertedTime.format(context),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
