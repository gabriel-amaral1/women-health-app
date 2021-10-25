import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question3.dart';


class Question2 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question2(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  bool _odorless = false;
  bool _putrid = false;

  String _odorlessButtonName;
  String _putridButtonName;

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
              methods.questionFont("Qual o odor do corrimento vaginal?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _odorless = false, boolean2: _putrid = false, name: _odorlessButtonName = "", name2: _putridButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _odorless = true, buttonName: _odorlessButtonName = "Inodor");
      
                          answer = _odorlessButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Inodor"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _odorless)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _odorless = false, boolean2: _putrid = false, name: _odorlessButtonName = "", name2: _putridButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _putrid = true, buttonName: _putridButtonName = "Pútrefo");
      
                          answer = _putridButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Pútrefo"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _putrid)
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
            methods.helpFloatingActionButton("helpOdour"),
            methods.nextQuestionFloatingActionButton(context, "odourQuestion", widget.symptomatology, "Odor", Question3(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer),
          ],
        ),
      )
    );
  }
}
