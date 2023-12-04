import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'mainlogin.dart';

class AppBarUser extends StatelessWidget {
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                          // SizedBox(height: 20.0,),
                          // Container(
                          //   alignment: Alignment.centerLeft,
                          //     child: Text.rich(TextSpan(children: [
                          //       TextSpan(text: "Wisata",
                          //         style: TextStyle(
                          //           fontSize: 25.0,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontFamily: "Poppins",
                          //         ),
                          //       ),
                          //       TextSpan(text: " Bandung",
                          //         style: TextStyle(
                          //           fontSize: 25.0,
                          //           color: Colors.white,
                          //           fontFamily: "Poppins",
                          //         ),
                          //       ),
                          //     ],),),
                          // ),
                        ],
                      ),),
                  ],
                ),);
          }else{
            return Container();
          }}
    );
  }
}
