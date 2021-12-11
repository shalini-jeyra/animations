import 'dart:async';

import 'package:animations/onboard.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleTransitionAnimation;
  late AnimationController _splashAnimationController;

  @override
  void initState() {
    super.initState();

    //initial animation controller
    _splashAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    //slide animation
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.75),
    ).animate(CurvedAnimation(
      curve: Curves.easeInBack,
      parent: _splashAnimationController,
    ));

    //fade animation
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_splashAnimationController);

    //scale transition
    _scaleTransitionAnimation = Tween<double>(
      begin: 1,
      end: 0.6,
    ).animate(_splashAnimationController);

    //animation starter code
    Timer(Duration(seconds: 2), () async{
      await _splashAnimationController.forward();
       Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => OnBoardingPage(
                     
                    )),
            (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleTransitionAnimation,
          child: Container(
            child: Image.asset(
              'assets/Ellipse 275.png',
            ),
          ),
        ),
      ),
    );
  }
}
