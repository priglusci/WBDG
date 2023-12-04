import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro2.dart';
import 'intro3.dart';
import 'intro4.dart';

class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  PageController _kontrolPageView = PageController();
  bool onFirstPage = false;
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _kontrolPageView,
            onPageChanged: (index){
              setState(() {
                onFirstPage = (index!=0);
                onLastPage = (index==2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          //TOMBOL NEXT
          onLastPage
            ?Container(
            ):Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right:30,top:60 ),
            child: GestureDetector(
              onTap: (){
                _kontrolPageView.nextPage(duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,);
              },
              child: (
                  Icon(
                    Icons.navigate_next_rounded,
                    size: 50,
                    color: Colors.white,
                  )
              ),
            ),
          ),

          //TOMBOL PREV
          onFirstPage
          ?Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left:30,top:60 ),
            child: GestureDetector(
              onTap: (){
                _kontrolPageView.previousPage(duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,);
              },
              child: (
                  Icon(
                    Icons.navigate_before_rounded,
                    size: 50,
                    color: Colors.white,
                  )
              ),
            ),
          ):Container(

          ),
          //ANIMASI SLIDE
          Container(
            alignment: Alignment(0,0.70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                    controller: _kontrolPageView,
                    count:  3,
                    axisDirection: Axis.horizontal,
                    effect:  WormEffect(
                        spacing:  10.0,
                        dotHeight: 12,
                        dotWidth: 12,
                        dotColor:  Colors.grey,
                        activeDotColor:  Colors.white,
                    ),
                  )
                ],
              )),
        ],
      )
    );
  }
}
