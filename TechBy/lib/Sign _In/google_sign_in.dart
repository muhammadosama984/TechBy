import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/googleUser.dart';

class GoogleSingInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool signInDone = false;
  //googleUser userDetails=googleUser(email: emailAddress(), userName: userName(), profilePic: photoUrl());
  late googleUser userDetails;
  GoogleSignInAuthentication? googleAuth;

  OAuthCredential? credential;

  GoogleSignInAccount get user => _user!;
  FirebaseAuth auth = FirebaseAuth.instance;
  var user_things = FirebaseAuth.instance.currentUser;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    googleAuth = await googleUser.authentication;
    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential!);
    await userEntryToDatabase();
    user_things=await FirebaseAuth.instance.currentUser;
    await googleUserDetails();

    signInDone = true;
    notifyListeners();
  }

  Future<String> emailAddress() async {
    String? email = await user_things?.email.toString();
    return email!;
  }

  Future<String> userName() async {
    String? name = await user_things?.displayName.toString();
    return name!;
  }

  Future<String> photoUrl() async {
    String? photoURl = await user_things?.photoURL.toString();

     return photoURl! ;

  }

  Future googleUserDetails() async {
    String email = await emailAddress().toString();
    String name = await userName().toString();
    String URL = await photoUrl().toString();
    userDetails =  googleUser(email: email, userName: name, profilePic: URL);
    print(email.toString());

  }

  Future userEntryToDatabase() async {
    UserCredential userCredential =
        await auth.signInWithCredential(credential!);
    DocumentSnapshot userExist = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userCredential.user!.uid)
        .get();
    List<DocumentReference> roomsArr = [];
    if (userExist.exists) {
      print("User already exists");
    } else {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName,
        'image': userCredential.user!.photoURL,
        'uid': userCredential.user!.uid,
        'date': DateTime.now(),
        'rooms': roomsArr,
      });
    }
  }

  Future googleSignOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<bool> checkSignedIn() async {
    final signin = await auth.currentUser;
    if (signin != null) {
      return true;
    }
    return false;
  }
}
