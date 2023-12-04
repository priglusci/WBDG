import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wbdg/login/authmanagement.dart';
//import 'package:wbdg/login/login.dart';
import 'package:wbdg/login/mainlogin.dart';
import '../user/dashboarduser2.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Center(
        child:
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 0.0, left: 21, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https://cdn-icons-png.flaticon.com/512/147/147133.png", height: 52.0, ),
                  SizedBox( width: 9.0),
                  Expanded(
                    child: Text("Hai, Admin Gans", style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthService authService = AuthService();
                      authService.logOut(context);
                    },
                    child: Icon(
                      Icons.logout_rounded,
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
              SizedBox(height: 15.0),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashboardKaks2(),),),
                child: Stack(
                  children: [
                    Container(height: 250, width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                          image: NetworkImage("https://www.wisataidn.com/wp-content/uploads/2020/07/Ranca-upas-ciwidey-bandung-750x450.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24.0,
                      right: 24.0,
                      child: Container(height: 34.0, width: 68,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 3.0, height: 3.0),
                            Icon(
                              Icons.star_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(width: 3.0,height: 3.0),
                            Text("4.9/5",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      left: 20.0,
                      right: 0.0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ranca Upas",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Row(children: [
                            Text("Untuk keterangan ranca upas",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],)
                        ],),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
