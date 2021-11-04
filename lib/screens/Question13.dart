import 'package:flutter/material.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:path/path.dart';

class Question13 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question13(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question13State createState() => _Question13State();
}

class _Question13State extends State<Question13> {
  Methods methods = new Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: methods.appBarFont("Sintomatologia"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
      ),
    );
  }
}
