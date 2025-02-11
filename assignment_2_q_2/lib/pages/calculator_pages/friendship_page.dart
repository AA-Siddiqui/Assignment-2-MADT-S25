import 'dart:math';

import 'package:flutter/material.dart';

class FriendshipPage extends StatefulWidget {
  const FriendshipPage({super.key});

  @override
  State<FriendshipPage> createState() => _FriendshipPageState();
}

class _FriendshipPageState extends State<FriendshipPage> {
  int _friendship = 0;
  void _calculateFriendship(String? value) {
    setState(() {
      _friendship = Random().nextInt(30) + 70;
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
              "Friendship Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your name",
                  ),
                  onChanged: _calculateFriendship,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your friend's name",
                  ),
                  onChanged: _calculateFriendship,
                ),
              ],
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "Your friendship is \n",
                children: [
                  TextSpan(
                    text: _friendship.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(text: "%"),
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
