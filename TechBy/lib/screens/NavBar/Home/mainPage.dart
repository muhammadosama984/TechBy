import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/savedAdsList.dart';
import '../../../database/adsList.dart';
import '../../../general widgets/Search.dart';
import '../../signIn pages/signInScreens/notification_api.dart';
import 'widgets/browseProduct.dart';
import 'widgets/categories.dart';
import 'widgets/grid.dart';
import 'widgets/textWidgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  String email = "";

  void initState() {
    // TODO: implement initState

    super.initState();
    getTasks();
  }

  getTasks() async {
    isLoading = true;
    setState(() {});
    await context.read<adsList>().getAds();
    email = await Provider.of<GoogleSingInProvider>(context, listen: false)
        .emailAddress();
    await context.read<savedAdsList>().getMyAds(emailAddress: email);
    await context
        .read<adsList>()
        .get_savedAds_ads(context.read<savedAdsList>().ListOfsavedAds);

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 159, 217, 1),
        title: Image.asset(
          'assets/TBweb.png',
          fit: BoxFit.cover,
          color: Colors.white,
          width: 100,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              NotificationApi.showNotification(
                  title: 'Osama', body: 'This is body', payload: '');
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SearchPage(
                        searchList: context.read<adsList>().ListOfAds,
                      ))),
              icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Card(
            child: ListView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                browseProduct(),
                categories(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                suggestedProdText(),
                SizedBox(
                  height: 40,
                ),
                Grid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
