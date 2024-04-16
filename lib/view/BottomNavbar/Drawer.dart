import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Dashboard/Chat_View/ChatList.dart';
import 'package:meettown/view/Feeds/MainFeeds.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color:appColors.textBlueColor,
            ),
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.all(5),
              
            accountName: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            accountEmail: Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/relaxed-girl-touching-her-head_23-2147611624.jpg?w=360&t=st=1711729926~exp=1711730526~hmac=265504122da6be17e0e0744e35b796af461f531609fce1eb1c265a210b2063f5',
              ),
            ),
            decoration: BoxDecoration(
              color: appColors.textBlueColor,
            ),
          ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: Text('Travels'),
            onTap: () {
              // Navigate to travels screen
            },
          ),
          ListTile(
            leading: Icon(Icons.rss_feed),
            title: Text('Feeds'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedPage()));

              // Navigate to feeds screen
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Likes'),
            onTap: () {
              
              // Navigate to likes screen
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatListScreen()));
              // Navigate to chats screen
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: MyDrawer(), // Use the custom drawer
      body: Center(
        child: Text('Home Screen'),
      ),
    ),
  ));
}
