import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  double _timeInHr = 0;
  double _timeInMin = 0;
  double _timeInSec = 0;
  int _index = 0;
  double _enteredValue = 0;

  void _updateTime() {
    setState(() {
      switch (_index) {
        case 0:
          _timeInHr = _enteredValue;
          _timeInMin = _enteredValue * 60;
          _timeInSec = _enteredValue * 3600;
          break;

        case 1:
          _timeInMin = _enteredValue;
          _timeInHr = _enteredValue / 60;
          _timeInSec = _enteredValue * 60;
          break;

        case 2:
          _timeInSec = _enteredValue;
          _timeInMin = _enteredValue / 60;
          _timeInHr = _enteredValue / 3600;
          break;
      }
    });
  }

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
              "Time Converter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter time in ${[
                        "hour",
                        "minute",
                        "second",
                      ][_index]}",
                    ),
                    onChanged: (String? value) {
                      _enteredValue = double.tryParse(value ?? "0") ?? 0;
                      _updateTime();
                    },
                  ),
                ),
                DropdownButton(
                  underline: Container(),
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Hour"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Minute"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Second"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateTime();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: "Converted Time is \n",
                children: [
                  TextSpan(
                    text:
                        "${_timeInHr.toStringAsFixed(2)} hrs\n${_timeInMin.toStringAsFixed(2)} mins\n${_timeInSec.toStringAsFixed(2)} secs",
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
