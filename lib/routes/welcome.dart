import 'dart:async';

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      // Aligning vertically:
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Company logo
        Container(
          width: double.infinity,
          height: 200,
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/img/black_logo_no_bg.png',
            width: 200,
            height: 200,
          ),
        ),
        // Company WebSite
        Container(
          width: double.infinity,
          height: 50,
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          child: const Text(
            'www.delboniti.com',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        // Progress bar
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.all(20.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          child: const LinearProgressIndicator(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}
