import 'package:flutter/material.dart';
import '../login/anonym/dashboardan.dart';
import '../login/mainlogin.dart';

class IntroPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Column(
        children: [
          GestureDetector(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => assalamualaikum(),
                    )
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 90, right: 90, top: 500),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(new  Color(0xFFF9A826)), new Color(0xFFF9A826)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: Text(
                  "MASUK",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Danonym(),
                    )
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 80, right: 80, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(new  Color(0xFFF9A826)), new Color(0xFFF9A826)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: Text(
                  "MASUK SEBAGAI ANONYM",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}