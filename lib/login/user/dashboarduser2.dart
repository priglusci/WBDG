import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbdg/trending/trend1.dart';
import 'package:wbdg/trending/trend2.dart';
import 'package:wbdg/trending/trend3.dart';
import '../../news/menuCardNEWS.dart';
import '../../news/menuNEWS.dart';

class DashboardKaks2 extends StatefulWidget {
  const DashboardKaks2({Key? key}) : super(key: key);
  @override
  State<DashboardKaks2> createState() => _DashboardKaks2State();
}

class _DashboardKaks2State extends State<DashboardKaks2> {
  final currentUser = FirebaseAuth.instance;
  int _current = 0;

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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference News = firestore.collection('News');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 50, bottom: 0.0, left: 20),
                child: Text("News",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: News.orderBy('id', descending: false).snapshots(),
                  builder: (_,snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children: (snapshot.data! as QuerySnapshot).docs.map((e) =>menuCard(Menu(
                          id: e['id'],
                          image: e['_image'],
                          judul: e['_judul'],
                          subJudul: e['_subJudul'],
                          body: e['_body'],
                          penulis: e['_penulis'],
                        ),
                        ),).toList(),
                      );
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }
              ),
            ],
          ),
      ),

    );
  }
}
