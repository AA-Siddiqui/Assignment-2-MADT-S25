import 'package:assignment_2_q_2/pages/calculator_pages/age_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/area_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/bmi_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/currency_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/friendship_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/length_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/temperature_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/time_b_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/time_h_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/volume_page.dart';
import 'package:assignment_2_q_2/pages/calculator_pages/weight_page.dart';
import 'package:flutter/material.dart';

class Page {
  final String title;
  final Widget page;
  const Page({
    required this.title,
    required this.page,
  });
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<Page> pageList = [
    Page(title: "Friendship Calculator", page: FriendshipPage()),
    Page(title: "Currency Converter", page: CurrencyPage()),
    Page(title: "Temperature Converter", page: TemperaturePage()),
    Page(title: "BMI Converter", page: BmiPage()),
    Page(title: "Length Converter", page: LengthPage()),
    Page(title: "Area Converter", page: AreaPage()),
    Page(title: "Volume Converter", page: VolumePage()),
    Page(title: "Weight Converter", page: WeightPage()),
    Page(title: "Belgian Time to PKT Converter", page: TimeOfDayPage()),
    Page(title: "Age Calculator", page: AgePage()),
    Page(title: "Time Converter", page: TimePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter"),
      ),
      body: ListView.builder(
        itemCount: pageList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageList[index].page),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                pageList[index].title,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
