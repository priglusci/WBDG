import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbdg/login/mainlogin.dart';
import 'package:wbdg/trending/trend1.dart';
import 'package:wbdg/trending/trend2.dart';
import 'package:wbdg/trending/trend3.dart';

class Danonym extends StatefulWidget {
  Danonym();
  @override
  State<Danonym> createState() => _DanonymState();
}

class _DanonymState extends State<Danonym> {
  final currentUser = FirebaseAuth.instance;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData =[
    trend1Page(),
    trend2Page(),
    trend3Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Center(
        child:
        Container(
          padding: EdgeInsets.only(top: 50, bottom: 0.0, left: 21, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https://cdn-icons-png.flaticon.com/512/147/147133.png", height: 52.0, ),
                  SizedBox( width: 9.0),
                  Row(
                    children: [
                      Text("Hai ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),),
                    ],
                  ),
                  Expanded(
                    child: Text("Anonym",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>assalamualaikum(),),),
                    child: Icon(
                      Icons.logout_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  )
                ],),
              SizedBox(height: 20.0,),
              Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Trending",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextSpan(text: " Minggu Ini",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],),),
              ),
              SizedBox(height: 20.0),
              CarouselSlider(
                items: myData,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
