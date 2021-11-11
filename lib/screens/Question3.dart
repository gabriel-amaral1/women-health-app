import 'package:flutter/material.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:women_health_app/screens/Question4.dart';

class Question3 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question3(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  bool _mucoideFluida = false;
  bool _mucoideElastica = false;
  bool _pastosa = false;
  bool _grumosa = false;

  var answer;

  String _mucoideFluidaButtonName;
  String _mucoideElasticaButtonName;
  String _pastosaButtonName;
  String _grumosaButtonName;


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
            icon: Icon(Icons.close)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              methods.questionFont("Qual a consistência do corrimento vaginal?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _mucoideFluida = false, boolean2: _mucoideElastica = false, boolean3: _pastosa = false, boolean4: _grumosa = false, name: _mucoideFluidaButtonName = "", name2: _mucoideElasticaButtonName = "", name3: _pastosaButtonName = "", name4: _grumosaButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _mucoideFluida = true, buttonName: _mucoideFluidaButtonName = "Mucóide Fluida");
      
                          answer = _mucoideFluidaButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Mucóide Fluida"),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: methods.isSelected(context, _mucoideFluida)
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _mucoideFluida = false, boolean2: _mucoideElastica = false, boolean3: _pastosa = false, boolean4: _grumosa = false, name: _mucoideFluidaButtonName = "", name2: _mucoideElasticaButtonName = "", name3: _pastosaButtonName = "", name4: _grumosaButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _mucoideElastica = true, buttonName: _mucoideElasticaButtonName = "Mucóide Elástica");
      
                          answer = _mucoideElasticaButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Mucóide Elástica"),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: methods.isSelected(context, _mucoideElastica)
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
                          methods.setFalse(counter: methods.counter, boolean: _mucoideFluida = false, boolean2: _mucoideElastica = false, boolean3: _pastosa = false, boolean4: _grumosa = false, name: _mucoideFluidaButtonName = "", name2: _mucoideElasticaButtonName = "", name3: _pastosaButtonName = "", name4: _grumosaButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _pastosa = true, buttonName: _pastosaButtonName = "Pastosa");
        
                          answer = _pastosaButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Pastosa"),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: methods.isSelected(context, _pastosa)
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _mucoideFluida = false, boolean2: _mucoideElastica = false, boolean3: _pastosa = false, boolean4: _grumosa = false, name: _mucoideFluidaButtonName = "", name2: _mucoideElasticaButtonName = "", name3: _pastosaButtonName = "", name4: _grumosaButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _grumosa = true, buttonName: _grumosaButtonName = "Grumosa");
        
                          answer = _grumosaButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Grumosa"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _grumosa)
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
            methods.helpFloatingActionButton("helpConsistency"),
            methods.nextQuestionFloatingActionButton(context, "consistencyQuestion", widget.symptomatology, "Consistência", Question4(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer),
          ],
        ),
      )
    );
  }
}