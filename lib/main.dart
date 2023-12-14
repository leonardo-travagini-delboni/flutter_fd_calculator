import 'package:flutter/material.dart';
import 'package:flutter_fd_calculator/routes/home.dart';
import 'package:flutter_fd_calculator/routes/welcome.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Welcome(),
        '/home': (context) => const Home(),
      },
    ));
