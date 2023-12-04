import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../wisata/commentWisata.dart';
import '../wisata/commentCardWisata.dart';

class wisataScreen extends StatefulWidget {
  int id;
  String image;
  String judul;
  String body;
  String subJudul;
  String penulis;

  wisataScreen(this.id,this.image,this.judul,this.body,this.subJudul,this.penulis,
      {Key? key})
      : super(key: key);
  @override
  State<wisataScreen> createState() =>
      _wisataScreenState(id,image,judul,body,subJudul,penulis);
}

class _wisataScreenState extends State<wisataScreen> {
  int _id;
  String _image;
  String _judul;
  String _body;
  String _subJudul;
  String _penulis;
  _wisataScreenState(
      this._id,this._image,this._judul,this._body,this._subJudul,this._penulis
      );
  final currentUser = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController komencontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference komentarWisata = firestore.collection('users');
    String uid = currentUser.currentUser!.uid.toString();
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
     body: Container(
       child:
       ListView(
         children: [
           Container(
             child: Column(
               children: [
                 Stack(
                   children: [
                     Image.network(_image,
                       width: MediaQuery.of(context).size.width,
                       fit: BoxFit.cover,
                     ),
                     Padding(padding: EdgeInsets.all(20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           InkWell(
                             onTap: (){
                               Navigator.pop(context,true);
                             },
                             child: Container(
                               height: 65,
                               width: 65,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Color(0xffF9A826),
                               ),
                               child: Icon(
                                 Icons.arrow_back_rounded,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         ],

                       ),),
                     Column(
                       children: [
                         SizedBox(height: 230),
                         Container(
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.vertical(
                                 top: Radius.circular(20)
                             ),
                             color: Color(0xffF9A826),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(padding: EdgeInsets.symmetric(
                                 vertical: 30,
                                 horizontal: 24,
                               ),
                                 child:Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(_judul,
                                       style: TextStyle(
                                         fontSize: 25.0,
                                         color: Color(0xFF2F323E),
                                         fontWeight: FontWeight.bold,
                                         fontFamily: "Poppins",
                                       ),
                                     ),
                                     SizedBox(height: 5),
                                     Text(_penulis,
                                       style: TextStyle(
                                         fontSize: 15.0,
                                         color: Color(0xFF2F323E),
                                         fontFamily: "Poppins",
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Container(
                           width: MediaQuery.of(context).size.width,
                           color: Color(0xFF2F323E),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(padding: EdgeInsets.symmetric(
                                 vertical: 30,
                                 horizontal: 24,
                               ),
                                 child:Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(_body,
                                       style: TextStyle(
                                         fontSize: 14.0,
                                         color: Colors.white,
                                         fontFamily: "Poppins",
                                       ),
                                     ),
                                     SizedBox(height: 5),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.vertical(
                         top: Radius.circular(20)
                     ),
                     color: Color(0xffF9A826),
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(padding: EdgeInsets.symmetric(
                         vertical: 30,
                         horizontal: 24,
                       ),
                         child:Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Komentar",
                               style: TextStyle(
                                 fontSize: 25.0,
                                 color: Color(0xFF2F323E),
                                 fontWeight: FontWeight.bold,
                                 fontFamily: "Poppins",
                               ),
                             ),
                             SizedBox(height: 30),
                             //komentar box
                             StreamBuilder<QuerySnapshot>(
                                 stream: komentarWisata.where("_komentarWisata", isNotEqualTo: "").snapshots(),
                                 builder: (_,snapshot){
                                   if(snapshot.hasData){
                                     return Column(
                                       children: (snapshot.data! as QuerySnapshot).docs.map((e) =>commentCard(Komentar(
                                         name: e['name'],
                                         comment: e['_komentarWisata'],
                                       ),
                                       ),).toList(),
                                     );
                                   }else{
                                     return Container(
                                       padding: EdgeInsets.only(bottom: 10),
                                       child: Container(
                                           width: MediaQuery.of(context).size.width,
                                           height: 120,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: Colors.white,
                                           ),
                                           child:
                                           Center(
                                             child: Text("Komentar Tidak Ada",
                                               style: TextStyle(
                                                 color: Color(0xFF2F323E),
                                                 fontSize: 15.0,
                                                 fontWeight: FontWeight.bold,
                                                 fontFamily: "Poppins",),
                                             ),
                                           ),
                                       ),
                                     );
                                   }
                                 }
                             ),
                             Container(
                               height: 50,
                               padding: EdgeInsets.only(left: 20),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               child: TextField(
                                 ///maksimal komentar 90 karakter
                                 controller: komencontroller,
                                 maxLength: 90,
                                 decoration: InputDecoration(
                                   counterText: '',
                                   border: InputBorder.none,
                                   hintText: "Tinggalkan Reviewmu..",
                                   hintStyle: TextStyle(color: Color(0xFF2F323E).withOpacity(0.5),
                                     fontFamily: "Poppins",
                                     fontSize: 12.0,
                                   ),
                                 ),
                               ),
                             ),
                             GestureDetector(
                               onTap: () async{
                                 komentarWisata.where("_komentarWisata", isEqualTo: "");
                                 await FirebaseFirestore.instance.collection("users")
                                     .doc(uid)
                                     .update({
                                   '_komentarWisata':komencontroller.text,
                                 });
                                 print(uid);
                               },
                               child: Container(
                                 padding: EdgeInsets.only(top: 10),
                                 child: Center(
                                   child: Container(
                                     padding: EdgeInsets.only(left: 10, right: 10),
                                     height: 60,
                                     width: 200,
                                     decoration: BoxDecoration(
                                       color: Color(0xFF2F323E),
                                       borderRadius: BorderRadius.circular(20)
                                     ),
                                     child: Center(
                                       child: Text("Kirim",
                                       style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 15.0,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "Poppins",),
                                     ),
                                     ),
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
    );
  }
}