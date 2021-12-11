import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Graphic-slide-7.png'),
          const Text(
            'Consult and \nstay Connected!',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 64, 64),
                fontSize: 35,
                fontFamily: 'Lato'),
          ),
          const Padding(
            padding: EdgeInsets.only(left:32.0,right: 32.0),
            child: Text(
              'Consult a doctor from any of the medicine streams and stay connected forever',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const DotsIndicator(
            dotsCount: 4,
            axis: Axis.horizontal,
            reversed: true,
          ),
        SizedBox(
          width:250,
          height: 50,
          child: ElevatedButton(
              child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "get started".toUpperCase(),
            style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold)
          ),
              ),
              style: ButtonStyle(
               
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
              
            )
          )
              ),
              onPressed: () {}
            ),
        )
        ],
      ),
    ));
  }
}
