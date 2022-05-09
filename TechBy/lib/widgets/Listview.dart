import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/ProductDetail.dart';

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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            Ads: context.watch<adsList>().ListOfAds[index],
                          )));
                },
                child: Container(
                  height: 130,
                  child: ListTile(
                      leading: Image.network(
                        widget.comingList[index].downloadURLS[0],
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        widget.comingList[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Price: " +
                            widget.comingList[index].price +
                            "\nLocation: " +
                            widget.comingList[index].location,
                      ),
                      trailing: Heart()),
                ),
              ),
            );
          })),
    );
  }
}

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

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
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

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
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
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
              isFav ? _controller.reverse() : _controller.forward();
            },
          );
        });
  }
}
