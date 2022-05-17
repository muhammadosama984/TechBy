import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/NavBar/more%20page/Screens/Contact_Us/ContactUs_Page.dart';
import 'package:techby/screens/signIn%20pages/signInScreens/OpeningPage.dart';

import '../Screens/FAQs_Page.dart';
import '../Screens/MyFav.dart';

class myFavTile extends StatelessWidget {
  double i;
  double j;

  myFavTile({Key? key, required this.i, required this.j}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: j,
      margin: EdgeInsets.all(i),
      shadowColor: Colors.black,
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.favorite, color: Colors.red),
        title: Text("My Favorite"),
        onTap: ()async{
          await context.read<adsList>().getAds();

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyFav()));
        },
      ),
    );
  }
}

class FAQ_Tile extends StatelessWidget {
  double i;
  double j;

  FAQ_Tile({Key? key, required this.i, required this.j}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: j,
      margin: EdgeInsets.all(i),
      shadowColor: Colors.black,
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.question_answer_rounded,
            color: Color.fromRGBO(30, 159, 217, 1)),
        title: Text("FAQs"),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FAQs_screen()));
        },
      ),
    );
  }
}

class ContactUsTile extends StatelessWidget {
  double i;
  double j;

  ContactUsTile({Key? key, required this.i, required this.j}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: j,
      margin: EdgeInsets.all(i),
      shadowColor: Colors.black,
      child: ListTile(
        tileColor: Colors.white,
        leading:
            Icon(Icons.message_sharp, color: Color.fromRGBO(30, 159, 217, 1)),
        title: Text("Contact  Us"),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ContactUs_scrren()));
        },
      ),
    );
  }
}

class LogoutTile extends StatelessWidget {
  double i;
  double j;

  LogoutTile({Key? key, required this.i, required this.j}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: j,
      margin: EdgeInsets.all(i),
      shadowColor: Colors.black,
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
        title: Text(
          "Logout",
          style: TextStyle(color: Colors.red),
        ),
        onTap: () async {
          bool isLogout = false;
          isLogout = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('You want to LogOut'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<GoogleSingInProvider>(context,
                                    listen: false)
                                .googleSignOut();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OpeningPage()));
                          },
                          child: Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No')),
                    ],
                  ));
        },
      ),
    );
  }
}
