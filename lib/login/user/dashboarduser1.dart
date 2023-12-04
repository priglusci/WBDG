import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wbdg/login/mainlogin.dart';
import 'package:wbdg/login/user/navbaruser.dart';
import 'package:wbdg/trending/trend1.dart';
import 'package:wbdg/trending/trend2.dart';
import 'package:wbdg/trending/trend3.dart';
import 'package:wbdg/trending/trendController.dart';
import '../user/dashboarduser2.dart';
import '../authmanagement.dart';

class DashboardKaks extends StatefulWidget {
  const DashboardKaks({Key? key}) : super(key: key);
  @override
  State<DashboardKaks> createState() => _DashboardKaksState();
}

class _DashboardKaksState extends State<DashboardKaks> {
  final currentUser = FirebaseAuth.instance;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData =[
    trend1Page(),
    trend2Page(),
    trend3Page(),
  ];
  int selectedIndex = 0;
  List<String> category =[
    "Berita Bandung",
    "Wisata Bandung",
    "Kuliner Bandung"
  ];
  int selectNav = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: Container(
      //   color: Color(0xFFF9A826),
      //   child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      //     child: GNav(
      //       gap: 10,
      //       backgroundColor: Color(0xFFF9A826),
      //       activeColor:Colors.white,
      //       tabBackgroundColor: Colors.black.withOpacity(0.2),
      //       color: Colors.white,
      //       padding: EdgeInsets.all(12),
      //       tabs: const[
      //         GButton(icon: Icons.home_rounded,
      //           text: "Home",
      //         ),
      //         GButton(icon: Icons.streetview_rounded,
      //           text: "Wisata",
      //         ),
      //         GButton(icon: Icons.fastfood_rounded,
      //           text: "Kuliner",
      //         ),
      //         GButton(icon: Icons.search_rounded,
      //           text: "Search",
      //         ),
      //       ],
      //       selectedIndex: _selectedIndex,
      //       onTabChange: (index) {
      //         setState(() {
      //           _selectedIndex = index;
      //         });
      //       },
      //     ),
      //   ),
      // ),
      backgroundColor: Color(0xFF2F323E),
      body: Center(
        child:
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").where("uid",isEqualTo:currentUser.currentUser!.uid).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) =>
              Column(
                children: [
                  Container(
                  padding: EdgeInsets.only(top: 20, bottom: 0.0, left: 21, right: 21),
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
                              Text(snapshot.data!.docs[index]['name'],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),),],
                          ),
                          Expanded(
                            child: Text("",
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
                      SizedBox(height: 30.0,),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffEEEEEE),
                        ),
                        child: TextField(
                          cursorColor: Color(0xffF9A826),
                          decoration: InputDecoration(
                            focusColor: Color(0xffF9A826),
                            icon: Icon(
                              Icons.search_rounded,
                              color: Color(0xFFF9A826),
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF2F323E).withOpacity(0.5)
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
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
                  ),),
                  // StreamBuilder(
                  //     stream: FirebaseFirestore.instance.collection('trendingNews').snapshots(),
                  //     builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                  //       if(snapshot.hasData){
                  //         return ListView.builder(itemCount: snapshot.data!.docs.length,
                  //         itemBuilder: (context, index) =>
                  //             // Column(
                  //             //   children: [
                  //             //     Container(
                  //             //       alignment: Alignment.topLeft,
                  //             //       padding: EdgeInsets.only(top: 15, left: 21),
                  //             //       child: Text("Bandung Hari ini", style:
                  //             //       TextStyle(
                  //             //         fontSize: 25.0,
                  //             //         color: Colors.white,
                  //             //         fontWeight: FontWeight.bold,
                  //             //         fontFamily: "Poppins",
                  //             //       ),),
                  //             //     ),
                  //             //     Container(
                  //             //       alignment: Alignment.center,
                  //             //       padding: EdgeInsets.only(top: 10, left: 21,right: 21),
                  //             //       child: Row(
                  //             //         children: [
                  //             //           Container(height: 150, width: 150,
                  //             //             decoration: BoxDecoration(
                  //             //               color: Colors.white,
                  //             //               borderRadius: BorderRadius.circular(35.0),
                  //             //               image: DecorationImage(
                  //             //                 image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/telkomuniversity.jpg?alt=media&token=5aaef9c8-b0a4-41d3-a2ad-c18f401407ab'),
                  //             //                 fit: BoxFit.cover,
                  //             //               ),
                  //             //             ),
                  //             //           ),
                  //             //           Column(
                  //             //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             //             children: [
                  //             //               Text(snapshot.data!.docs[index]['_judul'], style: TextStyle(
                  //             //                 fontSize: 15.0,
                  //             //                 color: Colors.white,
                  //             //                 fontWeight: FontWeight.bold,
                  //             //                 fontFamily: "Poppins",
                  //             //               ),),
                  //             //             ],
                  //             //           ),
                  //             //         ],
                  //             //       ),
                  //             //     ),
                  //             //   ],
                  //             // ),
                  //         // Container(
                  //         //   child: Stack(
                  //         //     children: [
                  //         //       Container(height: 190, width: 120,
                  //         //         decoration: BoxDecoration(
                  //         //           color: Colors.white,
                  //         //           borderRadius: BorderRadius.circular(35.0),
                  //         //           image: DecorationImage(
                  //         //             image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/telkomuniversity.jpg?alt=media&token=5aaef9c8-b0a4-41d3-a2ad-c18f401407ab'),
                  //         //             fit: BoxFit.cover,
                  //         //           ),
                  //         //         ),
                  //         //       ),
                  //         //       Positioned(
                  //         //         bottom: 20.0,
                  //         //         left: 20.0,
                  //         //         right: 0.0,
                  //         //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //         //           children: [
                  //         //             Text(snapshot.data!.docs[index]['_judul'],
                  //         //               style: TextStyle(
                  //         //                 fontSize: 20.0,
                  //         //                 color: Colors.white,
                  //         //                 fontWeight: FontWeight.bold,
                  //         //                 fontFamily: "Poppins",
                  //         //               ),
                  //         //             ),
                  //         //             Row(children: [
                  //         //               Text(snapshot.data!.docs[index]['_subJudul'],
                  //         //                 style: TextStyle(
                  //         //                   fontSize: 12.0,
                  //         //                   color: Colors.white,
                  //         //                   fontFamily: "Poppins",
                  //         //                 ),
                  //         //               ),
                  //         //             ],)
                  //         //           ],),
                  //         //       ),
                  //         //     ],
                  //         //   ),
                  //         // ),
                  //         );
                  //       }else{
                  //         return Container();
                  //       }
                  //   }
                  // ),
                ],
              ),);
            }else{
              return Container();
          }}
        ),
      ),
    );
  }
}
