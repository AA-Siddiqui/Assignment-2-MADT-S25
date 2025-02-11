import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double _weightInKg = 0;
  double _heightInMeter = 280;
  double _bmi = 0;
  void _calculateBMI() {
    _bmi = _weightInKg / (_heightInMeter * _heightInMeter);
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
              "BMI Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter weight in KG",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _weightInKg = double.tryParse(value ?? "0") ?? 0;
                      _calculateBMI();
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter height in meters",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _heightInMeter = double.tryParse(value ?? "0") ?? 0;
                      _calculateBMI();
                    });
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Your BMI is \n",
                children: [
                  TextSpan(
                    text: _bmi.toStringAsFixed(1),
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
