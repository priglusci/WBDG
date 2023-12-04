import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2F323E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset('assets/images/intro3.png',
                height: 300.0,
                width: 300.0,
              ),
              Text("Kamu pasti bosen ya? \n Mau jalan-jalan keliling Bandung? \n atau \n Mau kulineran Bandung?",textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Poppins',
                ),),
            ],
          ),
        ],
      ),
    );
  }
}