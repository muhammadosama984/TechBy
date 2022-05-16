
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/ProductDetail.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.read<adsList>().ListOfAds.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      Ads: context.read<adsList>().ListOfAds[index],
                    )));
              }),
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      context.read<adsList>().ListOfAds[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                    Text(context.read<adsList>().ListOfAds[index].price),
                  ),
                ),
                child: Image.network(
                  context.read<adsList>().ListOfAds[index].downloadURLS[0],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        });
  }
}