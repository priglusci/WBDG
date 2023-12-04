import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class trend2Page extends StatefulWidget {
  @override
  State<trend2Page> createState() => _trend2PageState();
}
class _trend2PageState extends State<trend2Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>trend2detail(),),),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('trendingWisata').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
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
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/rancaupas.jpg?alt=media&token=5d66b80f-229a-4a0c-937d-f86ccf59867c'),
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
class trend2detail extends StatefulWidget {
  @override
  State<trend2detail> createState() => _detailTrendState();
}
class _detailTrendState extends State<trend2detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('trendingWisata').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/rancaupas.jpg?alt=media&token=5d66b80f-229a-4a0c-937d-f86ccf59867c',
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