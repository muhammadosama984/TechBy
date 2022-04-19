import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:techby/Models/ListOfProducts.dart';
import 'package:techby/Models/ListofUsers.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/screens/Admin_Page.dart';
import 'package:techby/screens/More_Page.dart';
import 'package:techby/screens/MyFav.dart';
import 'package:techby/screens/OpeningPage.dart';
import 'package:techby/screens/PostAds.dart';
import 'package:techby/screens/SearchResult.dart';
import 'package:techby/screens/Splash_Screen.dart';
import 'package:techby/screens/ViewMyAds.dart';
import 'package:techby/widgets/Listview.dart';


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
          create: (_) => GoogleSingInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListofUser(),
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
      ),
      home: Splash(),
    );
  }
}
