import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Dashboard/Chat_View/ChatList.dart';
import 'package:meettown/view/Dashboard/home.dart';
import 'package:meettown/view/SearchUser/Search_user.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 0),
        items: [
          PersistentBottomNavBarItem(
              icon: Icon(Icons.home),
              title: ("Dashboard"),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: Colors.white,),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.airplanemode_active),
              title: ("Near by"),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: Colors.white),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.card_travel_outlined),
              title: ("Travel"),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: Colors.white),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.notifications),
              title: ("Message"),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: Colors.white),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.account_circle),
              title: ("Search"),
              activeColorPrimary: const Color.fromARGB(255, 249, 247, 245),
              inactiveColorPrimary: Colors.white),
        ],
        navBarStyle: NavBarStyle.style6,
        // selectedIndex: _selectedIndex,
        backgroundColor: appColors.textBlueColor, // Set background color
        // iconSize: 26.0,
        // height: 60.0, // Set height
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInCirc,
        ),
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        screens: [
        Dashboard(),
        Dashboard(),
       Dashboard(),
       ChatListScreen(),
         SearchUserPage(),
        ],
      
    );
  }
}
