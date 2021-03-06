import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:techby/Models/ListOfProducts.dart';
import 'package:techby/Models/ListofUsers.dart';
import 'package:techby/Models/currentIndex.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/database/savedAdsList.dart';
import 'package:techby/database/verrifiedEmailsList.dart';

import 'package:techby/screens/signIn%20pages/signInScreens/Splash_Screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListofProduct(),
        ),
        ChangeNotifierProvider(
          create: (_) => indexChange(),
        ),
        ChangeNotifierProvider(
          create: (_) => adsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleSingInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => savedAdsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListofUser(),
        ),
        ChangeNotifierProvider(
          create: (_) => verifiedEmailsList(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Splash(),
    );
  }
}
