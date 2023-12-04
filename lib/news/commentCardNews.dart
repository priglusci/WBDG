import 'commentNEWS.dart';
import 'package:flutter/material.dart';

class commentCard extends StatelessWidget {

  final Komentar komentar;
  commentCard(this.komentar);

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child:
                Image.network("https://cdn-icons-png.flaticon.com/512/147/147133.png", height: 52.0, ),
              ),
              Container(
                width: 272,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                      child:
                      Text('${komentar.name}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      child:
                      Text('${komentar.comment}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
