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
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    // Getting the screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Displaying the Welcome screen
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue.shade800,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'DESENVOLVIDO POR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/img/leo.jpg',
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.3,
                  ),
                  const Text(
                    'www.leonardodelboni.com.br',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  LinearProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.blue.shade800,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
