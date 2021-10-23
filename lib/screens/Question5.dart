import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question6.dart';

class Question5 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question5(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question5State createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  bool _little = false;
  bool _moderate = false;
  bool _abundant = false;

  String _littleButtonName;
  String _moderateButtonName;
  String _abundantButtonName;

  var answer;

  Methods methods = new Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              methods.questionFont("Qual a quantidade de corrimento vaginal?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _little = false, boolean2: _moderate = false, boolean3: _abundant = false, name: _littleButtonName = "", name2: _moderateButtonName = "", name3: _abundantButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _little = true, buttonName: _littleButtonName = "Pouca/Discreta");
        
                          answer = _littleButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Pouca/Discreta"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _little)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _little = false, boolean2: _moderate = false, boolean3: _abundant = false, name: _littleButtonName = "", name2: _moderateButtonName = "", name3: _abundantButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _moderate = true, buttonName: _moderateButtonName = "Moderada");
        
                          answer = _moderateButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Moderada"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _moderate)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _little = false, boolean2: _moderate = false, boolean3: _abundant = false, name: _littleButtonName = "", name2: _moderateButtonName = "", name3: _abundantButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _abundant = true, buttonName: _abundantButtonName = "Abundante");
        
                          answer = _abundantButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Abundante"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _abundant)
                      ),
                    ),
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
            methods.helpFloatingActionButton("helpQuantity"),
            methods.nextQuestionFloatingActionButton(context, "quantityQuestion", widget.symptomatology, "Quantidade", Question6(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer),
          ],
        ),
      )
    );
  }
}