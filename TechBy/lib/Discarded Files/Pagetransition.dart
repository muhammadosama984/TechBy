import 'package:flutter/cupertino.dart';

class Pagetransition extends PageRouteBuilder{

  final Widget widget;
  Pagetransition({required this.widget}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context,
      Animation<double> animation,
      Animation<double> secanimation,
      Widget child){
      animation = CurvedAnimation(parent: animation, curve: Curves.ease);
      
      return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
      );
    },
    pageBuilder: (BuildContext context,
    Animation<double> animation,
    Animation<double> secanimation){
      return widget;
    }
  );
}