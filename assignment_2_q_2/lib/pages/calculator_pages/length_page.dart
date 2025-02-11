import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  double _lengthInMeter = 0;
  double _lengthInInches = 0;
  int _index = 0;
  double _enteredValue = 0;
  double _enteredInches = 0;

  void _updateLength() {
    setState(() {
      switch (_index) {
        case 0:
          _lengthInMeter = _enteredValue;
          _lengthInInches = _enteredValue * 39.37;
          break;

        case 1:
          _lengthInInches = (_enteredValue * 12) + _enteredInches;
          _lengthInMeter = _lengthInInches / 39.37;
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
              "Length Converter",
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
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter length in ${[
                            "Meters",
                            "Feet",
                          ][_index]}",
                        ),
                        onChanged: (String? value) {
                          _enteredValue = double.tryParse(value ?? "0") ?? 0;
                          _updateLength();
                        },
                      ),
                      if (_index == 1)
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Inches",
                          ),
                          onChanged: (String? value) {
                            _enteredInches = double.tryParse(value ?? "0") ?? 0;
                            _updateLength();
                          },
                        ),
                    ],
                  ),
                ),
                DropdownButton(
                  underline: Container(),
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Meter"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Feet, Inches"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateLength();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.end,
              TextSpan(
                text: "Converted Length is \n",
                children: [
                  TextSpan(
                    text:
                        "${_lengthInMeter.toStringAsFixed(2)}m\n${((_lengthInInches / 12).toInt()).toStringAsFixed(0)}'${(_lengthInInches % 12).toStringAsFixed(0)}\"",
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
