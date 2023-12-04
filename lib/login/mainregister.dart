  import 'package:flutter/material.dart';
  import 'package:wbdg/login/authmanagement.dart';
  import 'package:wbdg/login/mainlogin.dart';

  class syahadat extends StatelessWidget {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
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
                        end: Alignment.bottomCenter,
                      ),
                    ),
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
                                "Buat Akun",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),


                  //NAMA
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],

                    ),
                    child: TextField(
                      controller: authService.namecontroller,
                      cursorColor: Color(0xFFF9A826),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFFF9A826),
                        ),
                        hintText: "Masukan Nama",
                        hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),


                  //NOMOR HP
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],

                    ),
                    child: TextField(
                      controller: authService.phonecontroller,
                      cursorColor: Color(0xFFF9A826),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_callback_rounded,
                          color: Color(0xFFF9A826),
                        ),
                        hintText: "Masukan Nomor HP",
                        hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),


                  //EMAIL
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],

                    ),
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
                        focusedBorder: InputBorder.none,
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
                      cursorColor: Color(0xFFF9A826),
                      decoration: InputDecoration(
                        focusColor: Color(0xFFF9A826),
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

                  GestureDetector(
                    onTap: () {
                      if(authService.emailcontroller != "" && authService.passwordcontroller != ""){
                        authService.RegisterUser(context);
                      }
                    },

                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 90, right: 90, top: 20),
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
                        "REGISTER",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah Punya Akun?  ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.white,
                          ),),
                        GestureDetector(
                          child: Text(
                            "Masuk Sekarang",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF9A826)
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => assalamualaikum(),
                                )
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              )
          )
      );
    }
  }
