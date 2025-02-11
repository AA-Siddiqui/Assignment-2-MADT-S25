import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double _massInKg = 0;
  double _massInLbs = 0;
  int _index = 0;
  double _enteredValue = 0;

  void _updateMass() {
    setState(() {
      switch (_index) {
        case 0:
          _massInKg = _enteredValue;
          _massInLbs = _enteredValue * 2.205;
          break;

        case 1:
          _massInLbs = _enteredValue;
          _massInKg = _enteredValue / 2.205;
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
              "Mass Converter",
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
                      labelText: "Enter mass in ${[
                        "kg",
                        "lbs",
                      ][_index]}",
                    ),
                    onChanged: (String? value) {
                      _enteredValue = double.tryParse(value ?? "0") ?? 0;
                      _updateMass();
                    },
                  ),
                ),
                DropdownButton(
                  underline: Container(),
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("kg"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("lbs"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateMass();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: "Converted Mass is \n",
                children: [
                  TextSpan(
                    text:
                        "${_massInKg.toStringAsFixed(2)} kg\n${_massInLbs.toStringAsFixed(2)} lbs",
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
