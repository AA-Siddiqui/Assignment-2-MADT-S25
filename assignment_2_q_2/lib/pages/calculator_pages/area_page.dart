import 'package:flutter/material.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  double _areaInMeter2 = 0;
  double _areaInFeet2 = 0;
  int _index = 0;
  double _enteredValue = 0;

  void _updateArea() {
    setState(() {
      switch (_index) {
        case 0:
          _areaInMeter2 = _enteredValue;
          _areaInFeet2 = _enteredValue * 10.764;
          break;

        case 1:
          _areaInFeet2 = _enteredValue;
          _areaInMeter2 = _enteredValue / 10.764;
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
              "Area Converter",
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
                      labelText: "Enter area in ${[
                        "Meters",
                        "Feet",
                      ][_index]}²",
                    ),
                    onChanged: (String? value) {
                      _enteredValue = double.tryParse(value ?? "0") ?? 0;
                      _updateArea();
                    },
                  ),
                ),
                DropdownButton(
                  underline: Container(),
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Meter²"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Feet²"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateArea();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: "Converted Area is \n",
                children: [
                  TextSpan(
                    text:
                        "${_areaInMeter2.toStringAsFixed(2)} m²\n${_areaInFeet2.toStringAsFixed(2)} feet²",
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
