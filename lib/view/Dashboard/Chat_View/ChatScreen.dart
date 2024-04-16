import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';

class Message {
  final String sender;
  final String text;
  final DateTime time;

  Message({
    required this.sender,
    required this.text,
    required this.time,
  });
}

class ChatScreen extends StatelessWidget {
  final List<Message> _messages = [
    Message(sender: 'User 1', text: 'Hello!', time: DateTime.now()),
    Message(sender: 'User 2', text: 'Hi there!', time: DateTime.now()),
    Message(sender: 'User 2', text: 'Hello!', time: DateTime.now()),
    Message(sender: 'User 1', text: 'Hi there!', time: DateTime.now()),
    Message(sender: 'User 1', text: 'Hello!', time: DateTime.now()),
    Message(sender: 'User 2', text: 'Hi there!', time: DateTime.now()),
    Message(sender: 'User 2', text: 'Hello!', time: DateTime.now()),
    Message(sender: 'User 2', text: 'Hi there!', time: DateTime.now()),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: true,
        backgroundColor: appColors.textBlueColor,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: message.sender == 'User 1'
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  message.sender == 'User 1' ? Colors.grey[300] : Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.sender == 'User 1' ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${message.time.hour}:${message.time.minute}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send,color: appColors.textBlueColor,),
            onPressed: () {
              // Handle sending message
            },
          ),
        ],
      ),
    );
  }
}
