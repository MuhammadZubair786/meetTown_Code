import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';

class Post {
  final String userName;
  final String userImageUrl;
  final String postContent;
  final String PostImage;

  Post({
    required this.userName,
    required this.userImageUrl,
    required this.postContent,
    required this.PostImage
  });
}

class FeedPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      userName: 'John Doe',
      userImageUrl: 'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
      postContent: 'Travel to us After Long Time Any One Join.',
      PostImage: "https://img.freepik.com/free-photo/new-york-city-manhattan-with-statue-liberty_649448-1583.jpg?size=626&ext=jpg"
    ),
    Post(
      userName: 'Gale Smith',
      userImageUrl: 'https://img.freepik.com/free-photo/smiley-woman-holding-tablet-close-up_23-2148943507.jpg?t=st=1711732160~exp=1711732760~hmac=0cd323b3dc9dab12a7ccc2a875aa07ea1f75047928443b556050d7162b02b888',
      postContent: 'Join And Travel',
      PostImage: "https://img.freepik.com/free-photo/lifestyle-attractive-girl-with-tablet_144627-13352.jpg?w=360&t=st=1711732119~exp=1711732719~hmac=989eedb7a92ea1c5e846d268ac8a768a0d0cc19d86bacc7bcef73b8c78759ea7"
    ),
     Post(
      userName: 'John Doe',
      userImageUrl: 'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
      postContent: 'Travel to us After Long Time Any One Join.',
      PostImage: "https://img.freepik.com/premium-photo/young-woman-using-phone-bridge-against-sky_1048944-2102552.jpg?w=360"
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Feeds'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      backgroundColor: appColors.textBlueColor,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: posts[index]);
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  var post;

  PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color:const Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.userImageUrl),
            ),
            title: Text(post.userName,style: TextStyle(color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(post.postContent,style: TextStyle(color:appColors.textBlueColor),),
          ),
          SizedBox(height: 20,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.network(post.PostImage),
          ),
          
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up,color: Colors.black,),
                onPressed: () {
                  // Handle like button pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.comment,color: Colors.black,),
                onPressed: () {
                  // Handle comment button pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.share,color: Colors.black,),
                onPressed: () {
                  // Handle share button pressed
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

