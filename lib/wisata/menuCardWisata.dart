import 'package:flutter/material.dart';
import 'detailWisata.dart';
import 'menuWisata.dart';

class menuCard extends StatelessWidget {

  final Menu menu;
  menuCard(this.menu);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)
        =>wisataScreen(menu.id,menu.image,menu.judul,menu.body,menu.subJudul,menu.penulis),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child : Container(
          decoration: BoxDecoration(
            color: Color(0xffF9A826),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 120,
                  height: 110,
                  child: Image.network(menu.image,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 222,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text
                      ('${menu.judul}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF2F323E),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text('${menu.penulis}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xFF2F323E),
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text('${menu.subJudul}',
                      style: TextStyle(
                        fontSize: 10.0,
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
      ),
    );
  }
}
