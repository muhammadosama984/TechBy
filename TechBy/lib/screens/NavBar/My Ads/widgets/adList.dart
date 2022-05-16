import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/ProductDetail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class myAds extends StatefulWidget {
  const myAds({Key? key}) : super(key: key);

  @override
  _myAdsState createState() => _myAdsState();
}

class _myAdsState extends State<myAds> {
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
    // await context.read<savedAdsList>().getMyAds(emailAddress: email);
    // context.read<savedAdsList>().printList();
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
            elevation: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      Ads: context.watch<adsList>().ListOfMyAds[index],
                    ),
                  ),
                );
              },
              child: Container(
                child: Slidable(
              endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              children: [
              SlidableAction(
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (onPressed) async{

                bool isLogout = false;
                isLogout = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Do you want remove task'),
                    content:
                    const Text('This will remove task from list'),
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
                  ),
                );

              },
              )
              ],
              ),
                //height: 130,

                child: ListTile(
                  leading: Container(
                    width: 60,
                    child: Image.network(
                      context
                          .watch<adsList>()
                          .ListOfMyAds[index]
                          .downloadURLS[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(
                    context.watch<adsList>().ListOfMyAds[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Price: Rs "),
                          SizedBox(
                            width: 105,
                            child:
                            Text(context.watch<adsList>().ListOfMyAds[index].price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,),
                          )
                        ],),

                      // Text(
                      // "Price: Rs " + widget.comingList[index].price,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   softWrap: false,
                      //   // "\nLocation: " +
                      //     // widget.comingList[index].location,
                      // ),
                      Text("Location: " + context.watch<adsList>().ListOfMyAds[index].location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                  // subtitle: Text(
                  //   "Price: " +
                  //       context.watch<adsList>().ListOfMyAds[index].price +
                  //       "\nLocation: " +
                  //       context.watch<adsList>().ListOfMyAds[index].location,
                  // ),
                  trailing: Icon(
                    Icons.arrow_back_ios_new,
                   // Icons.arrow_left_rounded,
                    color: Colors.grey,
                      size: 15,

                  ),
                ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
