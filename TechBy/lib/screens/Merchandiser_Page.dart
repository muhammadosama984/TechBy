import 'package:flutter/material.dart';
import 'package:techby/general%20widgets/Search.dart';
import 'package:techby/screens/MerchandiserProfile_Page.dart';

class Merchandiser_screen extends StatefulWidget {
  const Merchandiser_screen({Key? key}) : super(key: key);

  @override
  State<Merchandiser_screen> createState() => _Merchandiser_screenState();
}

List<Merchandiser> data = [
  Merchandiser(name: "Subhan", id: "0012"),
  Merchandiser(name: "Osama", id: "0013"),
  Merchandiser(name: "Hamza", id: "0014"),
  Merchandiser(name: "Ahmed", id: "0015"),
];

class _Merchandiser_screenState extends State<Merchandiser_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Merchandiser List"),
          // automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(
                          searchList: [],
                        )));
                setState(() {});
                //new screen navigate
              },
              icon: Icon(Icons.search),
            ),
          ]),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: ListTile(
                        leading: Text(data[index].id),
                        title: Text(data[index].name),
                        // subtitle: Text(data[index].complain),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MerchandiserProfile_screen()));
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Merchandiser {
  String name;
  String id;
  Merchandiser({required this.name, required this.id});
}
