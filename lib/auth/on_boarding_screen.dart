import 'package:flutter/material.dart';
import 'package:iti/auth/login_screen.dart';
import 'package:iti/widget/my_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 70),
        child: PageView(
          onPageChanged: (pagenum) {
            setState(() {
              isLastPage = pagenum == 2;
            });
          },
          controller: controller,
          children: [
            Container(
              child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        border: Border.all(
                            color: Colors.pinkAccent,
                            width: 5,
                            style: BorderStyle.solid)),
                    child: Center(
                        child: Text(
                      'R',
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 50),
                    )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Fashion',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to our App \n Hope you will enjoy it',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset('assets/images/boarding.jpg')
              ]),
            ),
            Container(
              child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        border: Border.all(
                            color: Colors.pinkAccent,
                            width: 5,
                            style: BorderStyle.solid)),
                    child: Center(
                        child: Text(
                          'R',
                          style: TextStyle(color: Colors.pinkAccent, fontSize: 50),
                        )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Fashion',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to our App \n Hope you will enjoy it',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset('assets/images/boarding.jpg')
              ]),
            ),
            Container(
              child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        border: Border.all(
                            color: Colors.pinkAccent,
                            width: 5,
                            style: BorderStyle.solid)),
                    child: Center(
                        child: Text(
                          'R',
                          style: TextStyle(color: Colors.pinkAccent, fontSize: 50),
                        )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Fashion',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to our App \n Hope you will enjoy it',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset('assets/images/boarding.jpg')
              ]),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                primary: Colors.white,
                backgroundColor: Colors.pink,
                minimumSize: Size.fromHeight(70),
              ),
              onPressed: () async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 25),
              ))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.pink),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                        effect: WormEffect(
                            spacing: 10,
                            radius: 20,
                            dotWidth: 12,
                            dotHeight: 12,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.pink),
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        controller: controller,
                        count: 3),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child:
                          Text('Next', style: TextStyle(color: Colors.pink))),
                ],
              ),
            ),
    );
  }
}
