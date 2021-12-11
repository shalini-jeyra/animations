import 'dart:async';


import 'package:animations/splash_page/splash_widget.dart';
import 'package:flutter/material.dart';
class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            
            SplashWidget(),
	   
          ],
        ),
      ),
    );
  }
}


class SplashText extends StatefulWidget {
  const SplashText({ Key? key }) : super(key: key);

  @override
  _SplashTextState createState() => _SplashTextState();
}

class _SplashTextState extends State<SplashText> with TickerProviderStateMixin {
     late Animation<Offset> _slideAnimation;

  late Animation<double> _scaleTransitionAnimation;
  late AnimationController _splashAnimationController;
  @override
  void initState() {
    super.initState();
     _splashAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
     _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.75),
    ).animate(CurvedAnimation(
      curve: Curves.easeInBack,
      parent: _splashAnimationController,
    ));
      _scaleTransitionAnimation = Tween<double>(
      begin: 1,
      end: 0.6,
    ).animate(_splashAnimationController);
     Timer(const Duration(seconds: 1), () {
      _splashAnimationController.forward();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleTransitionAnimation,
          child: const SizedBox(
            height: 50,
            width: 50,
            child: Text('Hello')
          ),
        ),
      );
  }
}