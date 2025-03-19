import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_net/screens/profile/profileScreen.dart';
import 'package:provider/provider.dart';
import 'package:one_net/providers/postProvider.dart';
import 'package:one_net/providers/bottomMenuBarProvider.dart';
import 'package:one_net/widgets/bottomMenuBar.dart';
import 'package:one_net/screens/chain/chainScreen.dart';
import 'package:one_net/screens/addNew/addNewScreen.dart';
import 'package:one_net/screens/community/communityScreen.dart';
import 'package:one_net/screens/common/customDrawer.dart';
import 'package:one_net/widgets/homeAppBar.dart';
import '../../core/widgets/cards/storiesCarousel.dart';
import 'nearbyConnections.dart';
import '../../core/widgets/cards/postCard.dart';
import '../../core/widgets/cards/chainSuggestions.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const HomePage({
    super.key,
    required this.scaffoldKey,
    required this.refreshIndicatorKey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<PostProvider>(context, listen: false).loadPosts();
    });
  }

  Future<void> _onRefresh() async {
    await Provider.of<PostProvider>(context, listen: false).loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: RefreshIndicator(
        key: widget.refreshIndicatorKey,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              StoriesCarousel(),
              NearbyConnections(),
              Consumer<PostProvider>(
                builder: (context, postProvider, _) {
                  if (postProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final posts = postProvider.posts;
                  if (posts.isEmpty) {
                    return const Center(child: Text("No posts available"));
                  }

                  return Column(
                    children: [
                      PostCard(post: posts.first),
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
                      ...posts.skip(1).map((post) => PostCard(post: post)),
                    ],
                  );
                },
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
      Provider.of<BottomMenuBarProvider>(context, listen: false)
          .setPageIndex(0);
    });
    super.initState();
  }

  Widget _body() {
    return SafeArea(
      child: Consumer<BottomMenuBarProvider>(
        builder: (context, bottomMenuProvider, _) {
          return IndexedStack(
            index: bottomMenuProvider.pageIndex,
            children: [
              HomePage(
                key: const ValueKey("HomePage"),
                scaffoldKey: _scaffoldKey,
                refreshIndicatorKey: refreshIndicatorKey,
              ),
              ChainScreen(
                key: const ValueKey("ChainScreen"),
                scaffoldKey: _scaffoldKey,
              ),
              AddNewScreen(
                key: const ValueKey("AddNewScreen"),
                scaffoldKey: _scaffoldKey,
              ),
              CommunityScreen(
                key: const ValueKey("CommunityScreen"),
                scaffoldKey: _scaffoldKey,
              ),
              ProfileScreen(
                key: const ValueKey("ProfileScreen"),
                scaffoldKey: _scaffoldKey,
                userId: "",
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var bottomMenuProvider = Provider.of<BottomMenuBarProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomMenuBar(
        currentIndex: bottomMenuProvider.pageIndex,
        onTap: (index) {
          bottomMenuProvider.setPageIndex(index);
        },
      ),
      drawer: CustomDrawer(),
      body: _body(),
    );
  }
}
