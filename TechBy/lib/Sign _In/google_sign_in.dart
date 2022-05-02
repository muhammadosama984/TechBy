import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:techby/screens/navBarNavigation.dart';

class GoogleSingInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool signInDone=false;

  GoogleSignInAccount get user => _user!;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    signInDone=true;
    notifyListeners();
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
