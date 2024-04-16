import 'package:flutter/material.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Dashboard/Chat_View/ChatScreen.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: true,
        backgroundColor: appColors.textBlueColor,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of users
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/imgs/prof-pic.jpg'), // Replace with user's profile picture
            ),
            title: Text('User ${index + 1}'), // Replace with user's name
            subtitle: Text(
                'Last message sent or received'), // Replace with last message
            onTap: () {
              // Handle tapping on a user (e.g., navigate to chat screen)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
