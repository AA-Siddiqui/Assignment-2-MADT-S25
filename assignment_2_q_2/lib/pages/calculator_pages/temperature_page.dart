import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  double _tempInF = 0;
  double _tempInC = 0;
  int _index = 0;
  double _enteredValue = 0;

  void _updateTemp() {
    setState(() {
      switch (_index) {
        case 0:
          _tempInC = _enteredValue;
          _tempInF = (_enteredValue * 9 / 5) + 32;
          break;

        case 1:
          _tempInF = _enteredValue;
          _tempInC = (_enteredValue - 32) * 5 / 9;
          break;

        case 2:
          _tempInC = _enteredValue - 273;
          _tempInF = (_tempInC * 9 / 5) + 32;
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
              "Temperature Converter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter temperature in ${[
                        "Celsius",
                        "Farenheit",
                        "Kelvin"
                      ][_index]}",
                    ),
                    onChanged: (String? value) {
                      _enteredValue = double.tryParse(value ?? "0") ?? 0;
                      _updateTemp();
                    },
                  ),
                ),
                DropdownButton(
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Celsius"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Fahrenheit"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Kelvin"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateTemp();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.end,
              TextSpan(
                text: "Converted Temperature is \n",
                children: [
                  TextSpan(
                    text:
                        "${_tempInF.toStringAsFixed(1)} ℉\n${_tempInC.toStringAsFixed(1)} ℃\n${(_tempInC + 273).toStringAsFixed(1)} K",
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
