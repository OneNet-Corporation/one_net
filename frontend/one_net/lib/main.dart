import 'package:flutter/material.dart';
// import 'package:one_net/screens/home/login_screen.dart';
// import 'package:one_net/screens/home/profile_screen.dart';
import 'package:provider/provider.dart';
import 'providers/userProvider.dart';
import 'providers/bottomMenuBarProvider.dart';
import 'providers/postProvider.dart';
import 'config/themes/theme.dart';
import 'config/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BottomMenuBarProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneNet App',
      theme: AppTheme.appTheme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SFProText',
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.route(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
      initialRoute: "SplashPage",
    );
  }
}
