import 'dart:async';

import 'package:flutter/material.dart';
import 'introduction/intro1.dart';

class LayarPertama extends StatefulWidget {
  const LayarPertama({Key? key}) : super(key: key);

  @override
  State<LayarPertama> createState() => _LayarPertamaState();
}

class _LayarPertamaState extends State<LayarPertama> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intro1())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2F323E),
              Color(0xFF2F323E),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/logowbputih.png',
                  height: 170.0,
                  width: 170.0,
                ),
                Text("Walking Walking\nin Bandung",textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

