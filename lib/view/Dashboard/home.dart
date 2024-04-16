import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/BottomNavbar/BottomNavbar.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';
import 'package:meettown/view/Feeds/MainFeeds.dart';

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

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override


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

  
  Widget build(BuildContext context) {
    List<String> images = [
      'https://img.freepik.com/free-photo/couple-with-map-city-streets_1398-4674.jpg?w=360&t=st=1711728054~exp=1711728654~hmac=947c1b191231500790d20aad7c9aff191120eedc354d292a88480611b4869acf',
      'https://img.freepik.com/free-photo/medium-shot-smiley-people-traveling_23-2149272177.jpg?w=740&t=st=1711728106~exp=1711728706~hmac=ab049b75682fe0e5e42b654a081f494e6147dc43d36464e5888fb6156521c9f0',
      'https://img.freepik.com/free-photo/side-view-female-hiker-using-cellphone-outdoors_23-2147950678.jpg?w=740&t=st=1711728163~exp=1711728763~hmac=46ab0b04a3c1a649a71f9f317abbdc6eb3b7772b774b5789b5e0fdecd2d263ab',
      'https://img.freepik.com/premium-photo/closeup-hand-with-mobile-phone-map-background_53876-78571.jpg?w=360',
      'https://img.freepik.com/free-photo/travel-discovering-places-with-love-ones_23-2149065052.jpg?w=360&t=st=1711728219~exp=1711728819~hmac=2c193d3afcfe0cf3b87eb3165869edfde4a64e54779a29c3e3f7cf772ed82c34'
    ];

     List<String> imagesUsers = [
      'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=740&t=st=1711728819~exp=1711729419~hmac=4d33804488542e5d07677c6d33f1dd4e100d0bca746a1f05cb88bc8a604dc300',
      'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
      'https://img.freepik.com/free-photo/girl-sitting-near-window-looking-her-smartphone_1157-1533.jpg?w=360&t=st=1711728877~exp=1711729477~hmac=9d48c6334c1993d974d0b2f1dbf1c348c07a8cd73edd7f71e9cc69881942de6b',
      'https://img.freepik.com/free-photo/young-friends-having-fun-together_23-2149560814.jpg?w=360&t=st=1711728928~exp=1711729528~hmac=0f86dc43990e13c8d2c003d107cb2c94b33132315b8e202bf8d804953ef885b7',
    ];

    var addressLocation = [
      "https://img.freepik.com/free-photo/statue-liberty-liberty-island-new-york_268835-780.jpg?w=740&t=st=1711729322~exp=1711729922~hmac=cb04d0d26de02a26530912b086f5a75ed7fb36798ac90573e4e4c24030f049af",
      "https://img.freepik.com/free-photo/new-york-city-with-empire-state-building_649448-1551.jpg?w=740&t=st=1711729362~exp=1711729962~hmac=422a240206684630d127fb51e66ed49530cfe1becf8e01a2ee4e029957c84b61",
      "https://img.freepik.com/premium-photo/badshahi-mosque-mughal-era-congregational-mosque-lahore_759575-4358.jpg?w=740",
      "https://img.freepik.com/free-photo/buddha-statue-wat-mahathat-temple-precinct-sukhothai-historical-park_335224-905.jpg?t=st=1711729513~exp=1711733113~hmac=7e081d42d3438668283f87ccedfb7a4de117733dbc7d1c752e33e20d568e7783&w=740"
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meet Town"),
          centerTitle: true,
          backgroundColor: appColors.textBlueColor,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0, // Stretch slider across the screen
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                ),
                items: images.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 20),
                child: Text(
                  "Nearby",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: appColors.textBlueColor),
                ),
              ),
              // Your horizontal list of nearby travelers goes here
              // Example:
             Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Opacity(
                            opacity: 0.9,
                            child: Image.network(
                              imagesUsers[index % imagesUsers.length],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: appColors.textBlueColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child:
                            
                             Text(
                            index%2==0 ?  "Ayesha 21" :"Ali 21",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 20),
                child: Text(
                  "They travel this Month",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: appColors.textBlueColor),
                ),
              ),
            
              // Your horizontal list of nearby travelers goes here
              // Example:
             Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Opacity(
                            opacity: 0.8,
                            child: Image.network(
                              addressLocation[index],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child:
                            
                             Text(
                            index%2==0 ?  "US" :"UK",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 4, 24, 54),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),),
               ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: posts[index]);
        },
      ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Upcoming List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // Your upcoming list goes here
              // Example:
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Upcoming Item $index"),
                    subtitle: Text("Details about upcoming item $index"),
                    leading: Icon(Icons.event),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
