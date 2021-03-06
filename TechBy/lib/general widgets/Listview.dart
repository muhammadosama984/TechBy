import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/database/savedAds.dart';
import 'package:techby/database/savedAdsList.dart';
import 'package:techby/screens/productDetails/ProductDetail.dart';

import '../database/ads.dart';

class Lists extends StatefulWidget {
  final List<ads> comingList;

  const Lists({Key? key, required this.comingList}) : super(key: key);

  @override
  State<Lists> createState() => _ListState();
}

class _ListState extends State<Lists> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getTasks();
  }

  getTasks() async {
    isLoading = true;
    setState(() {});
    await context.read<adsList>().getAds();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.comingList.length,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          Ads: widget.comingList[index],
                        )));
              },
              child: Container(
                //height: 100,

                child: ListTile(
                  leading: Container(
                    width: 60,
                    child: Image.network(
                      widget.comingList[index].downloadURLS[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: 130,
                          child: Text(
                            widget.comingList[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: widget.comingList[index].verifiedAd
                            ? Icon(
                                Icons.verified,
                                color: Color.fromRGBO(30, 159, 217, 1),
                                size: 18,
                              )
                            : null,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Price: Rs "),
                          SizedBox(
                            width: 105,
                            child: Text(
                              widget.comingList[index].price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Location: " + widget.comingList[index].location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                  trailing: Heart3(
                    comingAd: widget.comingList[index],
                    // remove: (value) {
                    //   widget.comingList.remove(value);
                    //   setState(() {});
                    // },
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

class Heart extends StatefulWidget {
  final ads comingAd;

  Heart({Key? key, required this.comingAd}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    isFav = widget.comingAd.favAd;
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    _colorAnimation = ColorTween(
      begin: !widget.comingAd.favAd ? Colors.grey[400] : Colors.red,
      end: !widget.comingAd.favAd ? Colors.red : Colors.grey[400],
    ).animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        //if(!widget.comingAd.favAd)
        widget.comingAd.favAd = true;
        isFav = true;
        String emailAddress =
            Provider.of<GoogleSingInProvider>(context, listen: false)
                .userDetails
                .email
                .toString();
        print(emailAddress);
        await context
            .read<savedAdsList>()
            .addSavedAd(email: emailAddress, doc_ID: widget.comingAd.docID);
        await context.read<adsList>().updateAd(myAd: widget.comingAd);
        setState(() {});
      }
      if (status == AnimationStatus.dismissed) {
        //if(widget.comingAd.favAd)
        widget.comingAd.favAd = false;
        isFav = false;
        await context
            .read<savedAdsList>()
            .deleteSavedAd(dataBase_doc_ID: widget.comingAd.docID);

        await context.read<adsList>().updateAd(myAd: widget.comingAd);
        setState(() {});
      }
    });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              widget.comingAd.favAd
                  ? _controller.reverse()
                  : _controller.forward();
            },
          );
        });
  }
}

class Heart2 extends StatefulWidget {
  final ads comingAd;

  const Heart2({Key? key, required this.comingAd}) : super(key: key);

  @override
  State<Heart2> createState() => _Heart2State();
}

class _Heart2State extends State<Heart2> with SingleTickerProviderStateMixin {
  late Animation<double> _sizeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_controller);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: widget.comingAd.favAd ? Colors.red : Colors.grey[400],
        size: _sizeAnimation.value,
      ),
      onPressed: () async {
        if (widget.comingAd.favAd) {
          await context
              .read<savedAdsList>()
              .deleteSavedAd(dataBase_doc_ID: widget.comingAd.docID);

          await context.read<adsList>().updateAd(myAd: widget.comingAd);
        } else {
          String emailAddress =
              Provider.of<GoogleSingInProvider>(context, listen: false)
                  .userDetails
                  .email
                  .toString();
          print(emailAddress);
          await context
              .read<savedAdsList>()
              .addSavedAd(email: emailAddress, doc_ID: widget.comingAd.docID);
          await context.read<adsList>().updateAd(myAd: widget.comingAd);
        }
        setState(() {
          widget.comingAd.favAd = !widget.comingAd.favAd;
        });
      },
    );
  }
}

typedef MyIntCallback(List);

class Heart3 extends StatefulWidget {
  final ads comingAd;

  const Heart3({Key? key, required this.comingAd}) : super(key: key);

  @override
  State<Heart3> createState() => _Heart3State();
}

class _Heart3State extends State<Heart3> {
  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
        iconSize: 40,
        isFavorite: widget.comingAd.favAd,
        valueChanged: (_value) async {
          String emailAddress =
              Provider.of<GoogleSingInProvider>(context, listen: false)
                  .userDetails
                  .email
                  .toString();
          if (_value) {
            print(emailAddress);

            await context
                .read<savedAdsList>()
                .addSavedAd(email: emailAddress, doc_ID: widget.comingAd.docID);
            await context.read<adsList>().updateAd(myAd: widget.comingAd);
            context.read<savedAdsList>().ListOfsavedAds.add(
                savedAds(email: emailAddress, doc_ID: widget.comingAd.docID));
          } else {
            await context
                .read<savedAdsList>()
                .deleteSavedAd(dataBase_doc_ID: widget.comingAd.docID);

            await context.read<adsList>().updateAd(myAd: widget.comingAd);
            context.read<savedAdsList>().ListOfsavedAds.remove(
                savedAds(email: emailAddress, doc_ID: widget.comingAd.docID));
          }
          setState(() {
            widget.comingAd.favAd = _value;
          });
        });
  }
}
