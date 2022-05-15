import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/ads.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/database/savedAdsList.dart';
import 'package:techby/screens/ProductDetail.dart';

class ViewMyAds extends StatefulWidget {
  const ViewMyAds({Key? key}) : super(key: key);

  @override
  State<ViewMyAds> createState() => _ViewMyAdsState();
}

class _ViewMyAdsState extends State<ViewMyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyAds"),
        automaticallyImplyLeading: false,
      ),
      body: _adsList(),
    );
  }
}

class _adsList extends StatefulWidget {
  const _adsList({Key? key}) : super(key: key);

  @override
  _adsListState createState() => _adsListState();
}

class _adsListState extends State<_adsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyads();
  }

  getMyads() async {
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();
    await context.read<savedAdsList>().getMyAds(emailAddress: email);
    context.read<savedAdsList>().printList();
    await context.read<adsList>().myAds(email);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: context.watch<adsList>().ListOfMyAds.length,
        itemBuilder: ((context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          Ads: context.watch<adsList>().ListOfMyAds[index],
                        )));
              },
              child: Container(
                height: 130,
                child: ListTile(
                  leading: Image.network(
                    context.watch<adsList>().ListOfMyAds[index].downloadURLS[0],
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    context.watch<adsList>().ListOfMyAds[index].title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Price: " +
                        context.watch<adsList>().ListOfMyAds[index].price +
                        "\nLocation: " +
                        context.watch<adsList>().ListOfMyAds[index].location,
                  ),
                  trailing: IconButton(
                      onPressed: () async {
                        bool isLogout = false;
                        isLogout = await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Do you want remove task'),
                                  content: const Text(
                                      'This will remove task from list'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.read<adsList>().remove(context
                                              .read<adsList>()
                                              .ListOfMyAds[index]);

                                          setState(() {});
                                          Navigator.of(context).pop(false);
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
                      icon: Icon(
                        Icons.delete,
                        size: 34,
                      )),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
