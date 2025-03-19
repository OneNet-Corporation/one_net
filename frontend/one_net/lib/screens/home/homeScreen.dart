import 'package:flutter/material.dart';
import 'package:one_net/screens/profile/profileScreen.dart';
import 'package:provider/provider.dart';
import 'package:one_net/providers/bottomMenuBarProvider.dart';
import 'package:one_net/widgets/bottomMenuBar.dart';
import 'package:one_net/screens/chain/chainScreen.dart';
import 'package:one_net/screens/addNew/addNewScreen.dart';
import 'package:one_net/screens/community/communityScreen.dart';
import 'package:one_net/screens/common/customDrawer.dart';
import 'package:one_net/screens/home/homePage.dart';

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
