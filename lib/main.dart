import 'package:flutter/material.dart';
import 'package:ms_global_task1/constants/color_constants.dart';
import 'package:ms_global_task1/provider/json_data_provider.dart';
import 'package:ms_global_task1/provider/user_data_provider.dart';
import 'package:ms_global_task1/screens/all_posts.dart';
import 'package:ms_global_task1/screens/login_screen.dart';
import 'package:ms_global_task1/screens/splash_screen.dart';
import 'package:ms_global_task1/services/postFetchService.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (_) => UserDataProvider()),
          Provider(create: (_) => JsonDataProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
//primaryColor: Color(0xffE43228),
                primarySwatch: kPrimaryColor,
                accentColor: Color(0xFFAF0917)),
            routes: {
              '/login': (context) => const LoginScreen(),
              '/posts': (context) => AllPostsScreens(),
            },
            home: SplashScreen(),
          );
        }));
  }
}
