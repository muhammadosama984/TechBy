import 'package:flutter/material.dart';
import 'package:techby/screens/Merchandiser_Page.dart';


class MerchandiserProfile_screen extends StatefulWidget {
  const MerchandiserProfile_screen({Key? key}) : super(key: key);

  @override
  State<MerchandiserProfile_screen> createState() => _MerchandiserProfile_screenState();
}



class _MerchandiserProfile_screenState extends State<MerchandiserProfile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 32, right: 32, top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipOval(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249_960_720.png'),
                      // backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20,),
                        child: TextField(
                          decoration: InputDecoration(
                            // border: null,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              // borderRadius: BorderRadius. circular(25.0),
                            ),
                            fillColor: Color.fromRGBO(243, 243, 243, 100),
                            filled: true,
                            // labelText: "Name",
                            hintText: 'Name',
                          ),
                        ),
                      )
                    ],
                  ),

                )
              ],
            ),

          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 32, right: 32, top: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    // border: null,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 2.0),
                        // borderRadius: BorderRadius. circular(25.0),
                      ),

                      fillColor: Color.fromRGBO(243, 243, 243, 100),
                      filled: true,
                      hintText: '  Description',
                      contentPadding: EdgeInsets.symmetric(vertical: 40)
                  ),
                  maxLines: 5, // <-- SEE HERE
                  minLines: 1,
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    // border: null,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0),
                      // borderRadius: BorderRadius. circular(25.0),
                    ),
                    fillColor: Color.fromRGBO(243, 243, 243, 100),
                    filled: true,
                    // labelText: "Name",
                    hintText: 'Phone',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    // border: null,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0),
                      // borderRadius: BorderRadius. circular(25.0),
                    ),
                    fillColor: Color.fromRGBO(243, 243, 243, 100),
                    filled: true,
                    // labelText: "Name",
                    hintText: 'Location',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    // border: null,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 2.0),
                      // borderRadius: BorderRadius. circular(25.0),
                    ),
                    fillColor: Color.fromRGBO(243, 243, 243, 100),
                    filled: true,
                    // labelText: "Name",
                    hintText: 'Email Address',
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  // alignment: Alignment(1.0,0.0),
                    padding: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                            height: 50,
                            minWidth: 120,
                            disabledColor: Colors.blueAccent,
                            child: RaisedButton(
                              disabledElevation: 8.0,
                              onPressed: (){},
                              child: Text("Approved", style: TextStyle(fontSize: 20, color: Colors.white),),
                            )
                        ),
                        SizedBox(width: 20,),
                        ButtonTheme(
                            height: 50,
                            minWidth: 120,
                            disabledColor: Colors.blueAccent,
                            child: RaisedButton(
                              disabledElevation: 8.0,
                              onPressed: (){},
                              child: Text("Not Approved", style: TextStyle(fontSize: 20, color: Colors.white),),
                            )
                        )
                      ],
    )


                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


