import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/ads.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/database/savedAdsList.dart';
import 'package:techby/screens/productDetails/SearchResult.dart';

import '../../../signIn pages/signInScreens/notification_api.dart';

class desktop extends StatelessWidget {
  const desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            await context.read<adsList>().getAds();

            List<ads> passingAd = await context.read<adsList>().categoryAds(
                context.read<adsList>().ListOfAds,
                "Desktop",
                context.read<savedAdsList>().ListOfsavedAds);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ParticularProduct(
                  categoryList: passingAd,
                ),
              ),
            );
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/desktop.png'),
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class mobile extends StatefulWidget {
  const mobile({Key? key}) : super(key: key);

  @override
  State<mobile> createState() => _mobileState();
}

class _mobileState extends State<mobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          await context.read<adsList>().getAds();

          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Mobile",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
          NotificationApi.showNotification(
              title: 'DISCOUNT OFFER', body: 'Save upto 25%', payload: '');
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(05, 10, 05, 10),
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mobile.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

class laptop extends StatelessWidget {
  const laptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
          onTap: () async {
            await context.read<adsList>().getAds();
            List<ads> passingAd = await context.read<adsList>().categoryAds(
                context.read<adsList>().ListOfAds,
                "Laptop",
                context.read<savedAdsList>().ListOfsavedAds);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ParticularProduct(
                  categoryList: passingAd,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/laptop.png'),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.rectangle,
            ),
          )),
    );
  }
}

class camera extends StatelessWidget {
  const camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          await context.read<adsList>().getAds();

          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Camera",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/camera.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

class monitor extends StatelessWidget {
  const monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          await context.read<adsList>().getAds();

          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Monitor",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/monitor.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

class speaker extends StatelessWidget {
  const speaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          await context.read<adsList>().getAds();

          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Speaker",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/speaker.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
