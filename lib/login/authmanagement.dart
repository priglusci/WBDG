import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbdg/login/mainlogin.dart';
import 'package:wbdg/login/user/navbaruser.dart';
class AuthService{
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final _auth = FirebaseAuth.instance;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  void loginUser(context)async{
    try{
      await _auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text).then((value){
        print("User Berhasil Login");
        Navigator.push(context, MaterialPageRoute(builder: (c)=>navigasiBar()));
      });
    }catch(e){print(e);}
  }
  void RegisterUser(context)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text).then((value){
        print("User Berhasil Regist");
        firestore.collection('users').doc(_auth.currentUser!.uid).set({
          "name" :namecontroller.text,
          "phonenumber" :phonecontroller.text,
          "email" :emailcontroller.text,
          "password" :passwordcontroller.text,
          "uid" :_auth.currentUser!.uid,
          "_komentarNews" : "",
          "_komentarWisata" : "",
          "_komentarKuliner" : "",
        });
        Navigator.push(context, MaterialPageRoute(builder: (c)=>assalamualaikum()));
      });
    }catch(e){print(e);}
  }
  
  void logOut(context)async{
    _auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>assalamualaikum()), (route) => false);
  }

}
