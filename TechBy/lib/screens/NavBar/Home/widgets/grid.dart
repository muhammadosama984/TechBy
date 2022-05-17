import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/productDetails/ProductDetail.dart';

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
                    title: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            width: 110,
                            child: Text(
                              context.read<adsList>().ListOfAds[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        //Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.verified,
                            color: Color.fromRGBO(30, 159, 217, 1),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text("Rs "),

                        SizedBox(
                          width: 88,
                          child: Text(
                      '${context.read<adsList>().ListOfAds[index].price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                         ),
                  ),
                      ],
                    ),
                  ),
                ),
                child: Image.network(
                  context.read<adsList>().ListOfAds[index].downloadURLS[0],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        });
  }
}
