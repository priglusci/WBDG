import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wbdg/login/admin/dashboardadmin.dart';
import 'package:wbdg/login/anonym/dashboardan2.dart';
import 'package:wbdg/login/mainlogin.dart';
import 'package:wbdg/login/user/dashboarduser1.dart';
import 'package:wbdg/login/user/dashboarduser2.dart';
import 'package:wbdg/login/user/dashboarduser3.dart';
import 'package:wbdg/login/user/dashboarduser4.dart';

class navigasiBar extends StatefulWidget {
  @override
  _navigasiBarState createState() => _navigasiBarState();
}
class _navigasiBarState extends State<navigasiBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardKaks(),
    DashboardKaks2(),
    DashboardKaks3(),
    DashboardKaks4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F323E),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF9A826),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            gap: 10,
            backgroundColor: Color(0xFFF9A826),
            activeColor:Colors.white,
            tabBackgroundColor: Colors.black.withOpacity(0.2),
            color: Colors.white,
            padding: EdgeInsets.all(12),
            tabs: const[
              GButton(icon: Icons.home_rounded,
                text: "Home",
              ),
              GButton(icon: Icons.newspaper_rounded,
                text: "Berita",
              ),
              GButton(icon: Icons.streetview_rounded,
                text: "Wisata",
              ),
              GButton(icon: Icons.fastfood_rounded,
                text: "Kuliner",
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}