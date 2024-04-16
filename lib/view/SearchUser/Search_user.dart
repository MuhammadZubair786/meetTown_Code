import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';

class User {
  final String name;
  final String username;

  User({required this.name, required this.username});
}

class SearchUserPage extends StatefulWidget {
  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  late List<User> _users;
  late List<User> _filteredUsers;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _users = [
      User(name: 'John Doe', username: '@johndoe'),
      User(name: 'Jane Smith', username: '@janesmith'),
      User(name: 'Alice Johnson', username: '@alicejohnson'),
      // Add more users as needed
    ];
    _filteredUsers = _users;
  }

  void _filterUsers(String query) {
    setState(() {
      _filteredUsers = _users
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.username.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
        centerTitle: true,
        backgroundColor: appColors.textBlueColor,  
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterUsers,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredUsers[index].name),
                  subtitle: Text(_filteredUsers[index].username),
                  // You can add more UI elements here, like profile picture, etc.
                  onTap: () {
                    // Handle user selection
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}