import 'package:flutter/material.dart';

class Complaint_screen extends StatefulWidget {
  const Complaint_screen({Key? key}) : super(key: key);

  @override
  State<Complaint_screen> createState() => _Complaint_screenState();
}

List<Complain_Data> data = [
  Complain_Data(name: "Subhan", complain: "Seller sold faulty products."),
  Complain_Data(name: "Hamza", complain: "Buyer didn't showed up."),
  Complain_Data(name: "Osama", complain: "Damaged Products."),
  Complain_Data(name: "Ahmed", complain: "Seller didn't come."),
];

class _Complaint_screenState extends State<Complaint_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints"),
      ),
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
                        title: Text(data[index].name),
                        subtitle: Text(data[index].complain),
                        trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert_rounded),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Resolved"),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Not Resolved"),
                                    value: 2,
                                  )
                                ]),
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

class Complain_Data {
  String name;
  String complain;

  Complain_Data({required this.name, required this.complain});
}
