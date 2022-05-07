import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSingInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool signInDone = false;

  GoogleSignInAuthentication? googleAuth;

  OAuthCredential? credential;

  GoogleSignInAccount get user => _user!;
  FirebaseAuth auth = FirebaseAuth.instance;
  final user_things = FirebaseAuth.instance.currentUser;

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
    signInDone = true;
    notifyListeners();
  }

  Future<String> emailAddress() async {
    String? email = await user_things?.email.toString();
    return email!;
  }
  Future userEntryToDatabase() async{
    UserCredential userCredential=await auth.signInWithCredential(credential!);
    DocumentSnapshot userExist = await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).get();
    if(userExist.exists){
      print("User already exists");
    }
    else{
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set(
          {
            'email':userCredential.user!.email,
            'name':userCredential.user!.displayName,
            'image':userCredential.user!.photoURL,
            'uid':userCredential.user!.uid,
            'date':DateTime.now(),
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
