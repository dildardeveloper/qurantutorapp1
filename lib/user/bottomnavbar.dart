import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/user/homescreen.dart';
import 'package:qurantutorapp/user/userprof.dart';
import 'package:qurantutorapp/user/userrequest.dart';

class bottomnavbar extends StatefulWidget {
  bottomnavbar({
    super.key,
  });

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageIndex = [homescreen(), userrequest(), userprof()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: appcolor,
        unselectedItemColor: Color(0xff3B3A43),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Favorite.png",
              width: 20,
              height: 24,
            ),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/prof.png"),
            label: 'userprof',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
      ),
      body: pageIndex[_currentIndex],
    );
  }
}
