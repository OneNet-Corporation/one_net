import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:one_net/providers/bottomMenuBar_provider.dart';
import 'package:one_net/widgets/bottomMenuBar.dart';
import 'package:one_net/screens/chain/chain_screen.dart';
import 'package:one_net/screens/add_new/add_new_screen.dart';
import 'package:one_net/screens/community/community_screen.dart';
import 'package:one_net/screens/profile/profile_screen.dart';
import 'package:one_net/screens/common/custom_drawer.dart';
import 'package:one_net/widgets/homeAppBar.dart';
import 'storiesCarousel.dart';
import 'nearbyConnections.dart';
import '../../core/widgets/cards/post_card_Damian.dart';
import 'chainSuggestions.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const HomePage({
    super.key,
    required this.scaffoldKey,
    required this.refreshIndicatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              StoriesCarousel(),
              NearbyConnections(),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PostCard(
                    profileImage: "assets/images/users/alisha.png",
                    avatarBackColor: Color(0xFFDBC0DD),
                    username: "Alisha Doe",
                    location: "Los Angeles, CA",
                    timeAgo: "20h ago",
                    postText:
                        "Community connections are very important and this platform has all for it.",
                    mediaUrl: "assets/images/posts/dogs.png",
                    mediaType: MediaType.image,
                    likes: 12000,
                    comments: 10000,
                    shares: 122,
                    isOnline: true,
                  ),
                  ChainSuggestions(
                    users: [
                      {
                        "profileImage": "assets/images/users/alisha.png",
                        "name": "John Doe",
                        "backColor": "0xFFDBC0DD",
                        "username": "johndoe",
                      },
                      {
                        "profileImage": "assets/images/users/EricJack.png",
                        "name": "Eric Jack",
                        "backColor": "0xFFA2A8CD",
                        "username": "ericjack",
                      },
                      {
                        "profileImage": "assets/images/users/PaulJoe.png",
                        "name": "Paul Joe",
                        "backColor": "0xFD2B1AC",
                        "username": "pauljoe",
                      },
                      {
                        "profileImage": "assets/images/users/PaulJoe.png",
                        "name": "Paul Joe",
                        "backColor": "0xFD2B1AC",
                        "username": "pauljoe",
                      },
                    ],
                  ),
                  PostCard(
                    profileImage: "assets/images/users/JohnDoe2.png",
                    avatarBackColor: Color(0xFFB9CFD0),
                    username: "John Doe",
                    location: "Los Angeles, CA",
                    timeAgo: "20h ago",
                    postText:
                        "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
                    mediaType: MediaType.none,
                    likes: 12000,
                    comments: 10000,
                    shares: 122,
                    isOnline: true,
                  ),
                  PostCard(
                    profileImage: "assets/images/users/alisha.png",
                    avatarBackColor: Color(0xFFC2C7B8),
                    username: "Catherine",
                    location: "Los Angeles, CA",
                    timeAgo: "20h ago",
                    postText:
                        "Community connections are very important and this platform has all for it.",
                    mediaUrl: "assets/images/posts/woman.png",
                    mediaType: MediaType.image,
                    likes: 12000,
                    comments: 10000,
                    shares: 122,
                    isOnline: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BottomMenuBarProvider>(context, listen: false).setPageIndex =
          0;
    });
    super.initState();
  }

  Widget _body() {
    return SafeArea(
      child: _getPage(Provider.of<BottomMenuBarProvider>(context).pageIndex),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage(
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
      case 1:
        return ChainScreen(scaffoldKey: _scaffoldKey);
      case 2:
        return AddNewScreen(scaffoldKey: _scaffoldKey);
      case 3:
        return CommunityScreen(scaffoldKey: _scaffoldKey);
      case 4:
        return ProfileScreen(scaffoldKey: _scaffoldKey);
      default:
        return HomePage(
            scaffoldKey: _scaffoldKey,
            refreshIndicatorKey: refreshIndicatorKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    var bottomMenuProvider = Provider.of<BottomMenuBarProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomMenuBar(
        currentIndex: bottomMenuProvider.pageIndex,
        onTap: (index) {
          bottomMenuProvider.setPageIndex = index;
        },
      ),
      drawer: CustomDrawer(),
      body: _body(),
    );
  }
}
