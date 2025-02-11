import 'package:flutter/material.dart';

extension on DateTime {
  String formatDate() {
    const List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    String month = months[this.month - 1];
    return "$month $day, $year";
  }
}

extension on Duration {
  String formatAge() {
    int totalDays = inDays;
    int years = totalDays ~/ 365;
    int remainingDaysAfterYears = totalDays % 365;
    int months = remainingDaysAfterYears ~/ 30;
    int days = remainingDaysAfterYears % 30;

    List<String> parts = [];

    if (years > 0) parts.add('$years year${years > 1 ? 's' : ''}');
    if (months > 0) parts.add('$months month${months > 1 ? 's' : ''}');
    if (days > 0) parts.add('$days day${days > 1 ? 's' : ''}');

    return parts.isNotEmpty ? parts.join(', ') : '0 days';
  }
}

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  DateTime _date = DateTime.now();
  Duration _convertedDate = Duration();
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
              "Age Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Column(
              children: [
                Text(
                  _date.formatDate(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    _date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ) ??
                        DateTime.now();
                    setState(() {
                      _convertedDate = DateTime.now().difference(_date);
                    });
                  },
                  child: Text("Pick Your Birthdate"),
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Your age is \n",
                children: [
                  TextSpan(
                    text: _convertedDate.formatAge(),
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
