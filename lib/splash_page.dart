import 'dart:async';
import 'package:abheekbday/main.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void _navigateAfter() {
    print("done timer");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
    // Get.to(MyHomePage());
  }

  void startTimer() {
    Timer(const Duration(seconds: 6), _navigateAfter);
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // ScaleTransition(
            //   scale: animation,
            //   child:
            Center(
              // child: Text('Hello')
              child: RiveAnimation.asset(
                'Images/spiral.riv',
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
