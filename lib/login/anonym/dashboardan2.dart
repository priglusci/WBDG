import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class detailTrend extends StatefulWidget {
  const detailTrend({Key? key}) : super(key: key);

  @override
  State<detailTrend> createState() => _detailTrendState();
}
class _detailTrendState extends State<detailTrend> {

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('destinasiWisata').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network("https://www.wisataidn.com/wp-content/uploads/2020/07/Ranca-upas-ciwidey-bandung-750x450.jpg",
                              height: 200.0, width: size.width,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    height: 110.0,
                                    width: 60.0,
                                    child: Icon(
                                      Icons.navigate_before_rounded,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size.width / 2,

                                    child: Text(snapshot.data!.docs[index]['judulDestinasi'],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text(snapshot.data!.docs[index]['subJudulD'],
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],),
                              Divider(
                                thickness: 1.0,
                                color: Colors.white.withOpacity(0.08),
                                height: 32.0,
                              ),
                              Text(snapshot.data!.docs[index]['bodyDestinasi'],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Container(
                                height: 64,
                                width: size.width,
                                margin: EdgeInsets.only(top: 16.0),
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Tinggalkan Reviewmu..",
                                    hintStyle: TextStyle(color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 15.0,

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
                );
              }
              else{
                return Container();
              }
            }
        ),

      ),
    );
      //backup jangan hapus
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Stack(
      //         children: [
      //           Image.network("https://www.wisataidn.com/wp-content/uploads/2020/07/Ranca-upas-ciwidey-bandung-750x450.jpg",
      //           height: 200.0, width: size.width,
      //             fit: BoxFit.cover,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //             GestureDetector(
      //               onTap: () => Navigator.of(context).pop(),
      //               child: Container(
      //                 height: 110.0,
      //                 width: 60.0,
      //                 child: Icon(
      //                   Icons.navigate_before_rounded,
      //                   size: 50,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             )
      //           ],),
      //         ],
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 Container(
      //                   width: size.width / 2,
      //
      //                   child: Text("Ranca Upas",
      //                     style: TextStyle(
      //                       fontSize: 20.0,
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontFamily: "Poppins",
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Row(children: [
      //               Text("Untuk keterangan ranca upas",
      //                 style: TextStyle(
      //                   fontSize: 12.0,
      //                   color: Colors.white,
      //                   fontFamily: "Poppins",
      //                 ),
      //               ),
      //             ],),
      //             Divider(
      //               thickness: 1.0,
      //               color: Colors.white.withOpacity(0.08),
      //               height: 32.0,
      //             ),
      //             Text("Selain , Bandung juga punya area wisata terkenal di area selatan kota bernama Ciwidey. Di Ciwidey inilah kamu bisa menemukan , sebuah tempat wisata alam di Jawa Barat di mana kamu beneran bisa merasa seolah di alam lepas walau lokasinya cuma kurang dari 2 jam dari kota Bandung, lho!Nah, kalau kamu sering melihat foto orang-orang yang berpose bersama rusa di sebuah dataran hijau yang terlihat alami banget seolah di atas gunung, besar kemungkinan kamu sedang melihat foto orang-orang yang pergi ke Ranca Upas Bandung.",
      //               style: TextStyle(
      //                 fontSize: 15.0,
      //                 color: Colors.white,
      //                 fontFamily: "Poppins",
      //               ),
      //             ),
      //             Container(
      //               height: 64,
      //               width: size.width,
      //               margin: EdgeInsets.only(top: 16.0),
      //               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      //               decoration: BoxDecoration(
      //                 color: Colors.grey,
      //                 borderRadius: BorderRadius.circular(12.0),
      //               ),
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                   border: InputBorder.none,
      //                   hintText: "Tinggalkan Reviewmu..",
      //                   hintStyle: TextStyle(color: Colors.white,
      //                       fontFamily: "Poppins",
      //                       fontSize: 15.0,
      //
      //                   ),
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
  }
  // _fetch() async{
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   final _auth = FirebaseAuth.instance;
  //   var user = _auth.currentUser;
  //   var firebaseUser = _auth.currentUser;
  //   if(firebaseUser!=null){
  //     CollectionReference ref = FirebaseFirestore.instance
  //         .collection('users');
  //     ref.doc(user!.uid)
  //         .get(["name"]userName);
  //   }
  // }


}

