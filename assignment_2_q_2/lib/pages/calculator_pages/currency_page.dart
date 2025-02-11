import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  double _enteredAmount = 0;
  double _exchangeRate = 280;
  double _convertedAmount = 0;
  void _convertAmount() {
    _convertedAmount = _enteredAmount * _exchangeRate;
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
              "Currency Converter",
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
                    labelText: "Enter amount",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _enteredAmount = double.tryParse(value ?? "0") ?? 0;
                      _convertAmount();
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter exchange rate",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _exchangeRate = double.tryParse(value ?? "0") ?? 0;
                      _convertAmount();
                    });
                  },
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Converted Amount is \n",
                children: [
                  TextSpan(
                    text: _convertedAmount.toStringAsFixed(2),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(text: "\$"),
                    ],
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
