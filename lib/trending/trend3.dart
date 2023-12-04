import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class trend3Page extends StatefulWidget {
  @override
  State<trend3Page> createState() => _trend3PageState();
}
class _trend3PageState extends State<trend3Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>trend3detail(),),),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('trendingKuliner').snapshots(),
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
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/surabi.jpg?alt=media&token=e67897b7-eaf0-462c-b5c1-7d7d96b8edac'),
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
class trend3detail extends StatefulWidget {
  @override
  State<trend3detail> createState() => _detailTrendState();
}
class _detailTrendState extends State<trend3detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('trendingKuliner').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network('https://firebasestorage.googleapis.com/v0/b/ww-bandung.appspot.com/o/surabi.jpg?alt=media&token=e67897b7-eaf0-462c-b5c1-7d7d96b8edac',
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