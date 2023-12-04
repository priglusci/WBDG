import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class trend1Page extends StatefulWidget {
  @override
  State<trend1Page> createState() => _trend1PageState();
}
class _trend1PageState extends State<trend1Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>trend1detail(),),),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('trendingNews').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          // return Container(
          //   child: Stack(
          //     children: [
          //       Container(height: 250, width: size.width,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(35.0),
          //           image: DecorationImage(
          //             image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/telkomuniversity.jpg?alt=media&token=5aaef9c8-b0a4-41d3-a2ad-c18f401407ab'),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         top: 24.0,
          //         right: 24.0,
          //         child: Container(height: 34.0, width: 68,
          //           decoration: BoxDecoration(
          //             color: Colors.white.withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(35.0),
          //           ),
          //           child: Row(
          //             children: [
          //               SizedBox(width: 3.0, height: 3.0),
          //               Icon(
          //                 Icons.star_rounded,
          //                 size: 25,
          //                 color: Colors.white,
          //               ),
          //               SizedBox(width: 3.0,height: 3.0),
          //               Text("4.9/5",
          //                 style: TextStyle(
          //                   fontSize: 12.0,
          //                   color: Colors.white,
          //                   fontFamily: "Poppins",
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         bottom: 20.0,
          //         left: 20.0,
          //         right: 0.0,
          //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text("TESTT",
          //               style: TextStyle(
          //                 fontSize: 20.0,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontFamily: "Poppins",
          //               ),
          //             ),
          //             Row(children: [
          //               Text("Untuk keterangan ranca upas",
          //                 style: TextStyle(
          //                   fontSize: 12.0,
          //                   color: Colors.white,
          //                   fontFamily: "Poppins",
          //                 ),
          //               ),
          //             ],)
          //           ],),
          //       ),
          //     ],
          //   ),
          // );
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Container(
                  child: Stack(
                    children: [
                      Container(height: 190, width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/telkomuniversity.jpg?alt=media&token=5aaef9c8-b0a4-41d3-a2ad-c18f401407ab'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        right: 0.0,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.docs[index]['_judul'],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Row(children: [
                              Text(snapshot.data!.docs[index]['_subJudul'],
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
              );
            }
            else{
              return Container();
            }
        }
      ),
    );
  }
}
class trend1detail extends StatefulWidget {
  @override
  State<trend1detail> createState() => _detailTrendState();
}
class _detailTrendState extends State<trend1detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('trendingNews').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/telkomuniversity.jpg?alt=media&token=5aaef9c8-b0a4-41d3-a2ad-c18f401407ab',
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

                                    child: Text(snapshot.data!.docs[index]['_judul'],
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
                                Text(snapshot.data!.docs[index]['_subJudul'],
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
                              Text(snapshot.data!.docs[index]['_body'],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              // Container(
                              //   height: 64,
                              //   width: size.width,
                              //   margin: EdgeInsets.only(top: 16.0),
                              //   padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                              //   decoration: BoxDecoration(
                              //     color: Colors.grey,
                              //     borderRadius: BorderRadius.circular(12.0),
                              //   ),
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       hintText: "Tinggalkan Reviewmu..",
                              //       hintStyle: TextStyle(color: Colors.white,
                              //         fontFamily: "Poppins",
                              //         fontSize: 15.0,
                              //       ),
                              //     ),
                              //   ),
                              // )
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
  }
}
