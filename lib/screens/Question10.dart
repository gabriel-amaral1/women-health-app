import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question11.dart';

class Question10 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question10(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question10State createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  var contraceptiveMethod = [];
  
  bool _hormonal = false;
  bool _barrier = false;
  bool _diu = false;
  bool _pills = false;
  bool _injectables = false;
  bool _implants = false;
  bool _femaleCondom = false;
  bool _diafragmHood = false;
  bool _spermicides = false;

  String _hormonalButtonName;
  String _barrierButtonName;
  String _diuButtonName;
  String _pillsButtonName;
  String _injectablesButtonName;
  String _implantsButtonName;
  String _femaleCondomButtonNameButtonName;
  String _diafragmHoodButtonName;
  String _spermicidesButtonName;

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
              methods.questionFont("Qual?"),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _hormonal = true, buttonName: _hormonalButtonName = "Hormonal");
      
                          answer = _hormonalButtonName;
                          if(!contraceptiveMethod.contains(_hormonalButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Hormonal"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _hormonal)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _barrier = true, buttonName: _barrierButtonName = "Barreira");
      
                          answer = _barrierButtonName;
                          if(!contraceptiveMethod.contains(_barrierButtonName)) {
                            contraceptiveMethod.add(answer);
                          }

                          if(answer == null) {
                            answer = "";
                          }
                        });
                      }, 
                      child: methods.buttonFont("Barreira"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _barrier)

                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _diu = true, buttonName: _diuButtonName = "Diu");
      
                          answer = _diuButtonName;
                          if(!contraceptiveMethod.contains(_diuButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("DIU"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _diu)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _pills = true, buttonName: _pillsButtonName = "Pílulas");
      
                          answer = _pillsButtonName;
                          if(!contraceptiveMethod.contains(_pillsButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Pílulas"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _pills)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _injectables = true, buttonName: _injectablesButtonName = "Injetáveis");
      
                          answer = _injectablesButtonName;
                          if(!contraceptiveMethod.contains(_injectablesButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Injetáveis"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _injectables)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _implants = true, buttonName: _implantsButtonName = "Implantes");
      
                          answer = _implantsButtonName;
                          if(!contraceptiveMethod.contains(_implantsButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Implantes"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _implants)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _femaleCondom = true, buttonName: _femaleCondomButtonNameButtonName = "Preservativo Feminino");
      
                          answer = _femaleCondomButtonNameButtonName;
                          if(!contraceptiveMethod.contains(_femaleCondomButtonNameButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Preservativo Feminino"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _femaleCondom)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _diafragmHood = true, buttonName: _diafragmHoodButtonName = "Capuz/Diafragma");
      
                          answer = _diafragmHoodButtonName;
                          if(!contraceptiveMethod.contains(_diafragmHoodButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Capuz/Diafragma"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _diafragmHood)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
      
                          methods.setValues(counter: methods.counter, pressedButton: _spermicides = true, buttonName: _spermicidesButtonName = "Espermicidas");
      
                          answer = _spermicidesButtonName;
                          if(!contraceptiveMethod.contains(_spermicidesButtonName)) {
                            contraceptiveMethod.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Espermicidas"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _spermicides)
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
            methods.helpFloatingActionButton("helpContraceptiveMethodChoose"),
            methods.nextQuestionFloatingActionButton(context, "contraceptiveMethodChoose", widget.symptomatology, "Métodos Contraceptivos", Question11(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), contraceptiveMethod),
          ],
        ),
      )
    );
  }
}