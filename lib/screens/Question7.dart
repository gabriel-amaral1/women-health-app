import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question8.dart';


class Question7 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question7(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question7State createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  bool _yes = false;
  bool _no = false;

  String _yesButtonName;
  String _noButtonName;

  var answer;

  Methods methods = new Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: methods.appBarFont("Sintomatologia"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            }, 
            icon: Icon(Icons.close)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              methods.questionFont("Existem sangramentos intermenstruais?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _yes = false, boolean2: _no = false, name: _yesButtonName = "", name2: _noButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _yes = true, buttonName: _yesButtonName = "Sim");
      
                          answer = _yesButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Sim"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(_yes)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _yes = false, boolean2: _no = false, name: _yesButtonName = "", name2: _noButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _no = true, buttonName: _noButtonName = "Não");
      
                          answer = _noButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Não"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(_no)
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            methods.helpFloatingActionButton("helpBleeding"),
            methods.nextQuestionFloatingActionButton(context, "bleedingQuestion", widget.symptomatology, "Sangramentos Intermenstruais", Question8(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer),
          ],
        ),
      )
    );
  }
}
