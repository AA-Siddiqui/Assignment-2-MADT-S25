import 'package:flutter/material.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({super.key});

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  double _volumeInMeter3 = 0;
  double _volumeInFeet3 = 0;
  double _volumeInLiter = 0;
  int _index = 0;
  double _enteredValue = 0;

  void _updateVolume() {
    setState(() {
      switch (_index) {
        case 0:
          _volumeInMeter3 = _enteredValue;
          _volumeInFeet3 = _enteredValue * 35.315;
          _volumeInLiter = _enteredValue * 1000;
          break;

        case 1:
          _volumeInFeet3 = _enteredValue;
          _volumeInMeter3 = _enteredValue / 35.315;
          _volumeInLiter = _enteredValue * 28.31;
          break;

        case 2:
          _volumeInLiter = _enteredValue;
          _volumeInMeter3 = _enteredValue / 1000;
          _volumeInFeet3 = _enteredValue / 28.31;
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
              "Volume Converter",
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
                      labelText: "Enter volume in ${[
                        "Meters",
                        "Feet",
                        "Liter",
                      ][_index]}${_index != 2 ? '³' : ''}",
                    ),
                    onChanged: (String? value) {
                      _enteredValue = double.tryParse(value ?? "0") ?? 0;
                      _updateVolume();
                    },
                  ),
                ),
                DropdownButton(
                  underline: Container(),
                  value: _index,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Meter³"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Feet³"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Liter"),
                    ),
                  ],
                  onChanged: (index) {
                    _index = index ?? 0;
                    _updateVolume();
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: "Converted Volume is \n",
                children: [
                  TextSpan(
                    text:
                        "${_volumeInMeter3.toStringAsFixed(2)} m³\n${_volumeInFeet3.toStringAsFixed(2)} feet³ \n${_volumeInLiter.toStringAsFixed(2)} liter",
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
