import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'models/onboard.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _current = 0;
  final onBoard = Onboard(
    onboadingImages: [
      'assets/Graphic-slide-5-1.png',
      'assets/Graphic-slide-6.png',
      'assets/Graphic-slide-7.png',
    ],
    onboardingDetails: [
      'A permanent health profile would help you with instant medical advice based on your entire health history',
      'Bring your friends, family closer to your regular doctors and let them help you address all your health issues going forward',
      'Consult a doctor from any of the medicine streams and stay connected forever',
    ],
    onboardingTitles: [
      'Add your \nhealth profile!',
      'Build your\nhealth circles!',
      'Consult and \nstay Connected!',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: onBoard.onboadingImages.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                       
                          image: DecorationImage(
                            scale: 1,
                            image: AssetImage(
                              onBoard.onboadingImages[index],
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          30,
                          24,
                          24,
                          0,
                        ),
                        child: Text(
                          onBoard.onboardingTitles[index],
                        style: const TextStyle(
                color: Color.fromARGB(255, 0, 64, 64),
                fontSize: 35,
                fontFamily: 'Lato'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 0,
                          top: 10,
                        ),
                        child: Text(
                          onBoard.onboardingDetails[index],
                           style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .76,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  disableCenter: true,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) => setState(() {
                        _current = index;
                      })),
            ),
            Pageindicator(onBoard: onBoard, current: _current),
            SizedBox(
              height: 20,
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
            ),
           
          ],
        ),
      ),
    );
  }
}

class Pageindicator extends StatelessWidget {
  const Pageindicator({
    Key? key,
    required this.onBoard,
    required int current,
  })  : _current = current,
        super(key: key);

  final Onboard onBoard;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: onBoard.onboadingImages.map((url) {
        int index = onBoard.onboadingImages.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index ? Colors.black : Colors.grey),
        );
      }).toList(),
    );
  }
}