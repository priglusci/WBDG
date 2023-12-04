import 'package:flutter/material.dart';
import 'package:wbdg/login/admin/dashboardadmin.dart';
import 'package:wbdg/login/authmanagement.dart';
import 'package:wbdg/login/mainregister.dart';

import 'anonym/dashboardan.dart';

class assalamualaikum extends StatelessWidget {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2F323E),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90)),
                    color: Color(0xFFF9A826),
                    gradient: LinearGradient(
                        colors: [
                          (new Color(0xFFF9A826)),
                          (new Color(0xFFF9A826))
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                ),
                //header
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset("assets/images/logowbputih.png"),
                        height: 120,
                        width: 120,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "Masukan Akun",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: authService.emailcontroller,
                  cursorColor: Color(0xFFF9A826),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xFFF9A826),
                      ),
                      hintText: "Masukan Email",
                      hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                  ),
                ),
              ),
              //PASSWORD
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                ),
                child: TextField(
                  controller: authService.passwordcontroller,
                  obscureText: true,
                  cursorColor: Color(0xffF9A826),
                  decoration: InputDecoration(
                    focusColor: Color(0xffF9A826),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xFFF9A826),
                    ),
                    hintText: "Masukan Password",
                    hintStyle: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Text("Lupa Password?",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: GestureDetector(
                  onTap: () {
                    if(authService.emailcontroller != "" && authService.passwordcontroller != ""){
                      authService.loginUser(context);
                    }else if(authService.emailcontroller == "rezkymndr@admin.com" && authService.passwordcontroller != "admin123"){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>DashboardAdmin()));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 90, right: 90, top: 0),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        (new Color(0xFFF9A826)),
                        new Color(0xFFF9A826)
                      ],
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
                  onTap: () {
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
                      gradient: LinearGradient(colors: [
                        (new Color(0xFFF9A826)),
                        new Color(0xFFF9A826)
                      ],
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
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Ada Akun?  ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF9A826)
                        ),
                      ),
                      onTap: () {
                        // Write Tap Code Here.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => syahadat(),
                            )
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
