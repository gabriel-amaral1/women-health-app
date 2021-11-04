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
  bool _mucofluid = false;
  bool _fluid = false;
  bool _opaque = false;
  bool _sticky = false;
  bool _adherent = false;

  var answer;

  String _mucofluidButtonName;
  String _fluidButtonName;
  String _opaqueButtonName;
  String _stickyButtonName;
  String _adherentButtonName;


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
                          methods.setFalse(counter: methods.counter, boolean: _mucofluid = false, boolean2: _fluid = false, boolean3: _opaque = false, boolean4: _sticky = false, boolean5: _adherent = false, name: _mucofluidButtonName = "", name2: _fluidButtonName = "", name3: _opaqueButtonName = "", name4: _stickyButtonName = "", name5: _adherentButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _mucofluid = true, buttonName: _mucofluidButtonName = "Mucofluido");
      
                          answer = _mucofluidButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Mucofluido"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _mucofluid)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _mucofluid = false, boolean2: _fluid = false, boolean3: _opaque = false, boolean4: _sticky = false, boolean5: _adherent = false, name: _mucofluidButtonName = "", name2: _fluidButtonName = "", name3: _opaqueButtonName = "", name4: _stickyButtonName = "", name5: _adherentButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _fluid = true, buttonName: _fluidButtonName = "Fluido");
      
                          answer = _fluidButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Fluido"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _fluid)
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
                          methods.setFalse(counter: methods.counter, boolean: _mucofluid = false, boolean2: _fluid = false, boolean3: _opaque = false, boolean4: _sticky = false, boolean5: _adherent = false, name: _mucofluidButtonName = "", name2: _fluidButtonName = "", name3: _opaqueButtonName = "", name4: _stickyButtonName = "", name5: _adherentButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _opaque = true, buttonName: _opaqueButtonName = "Opaco");
        
                          answer = _opaqueButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Opaco"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _opaque)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _mucofluid = false, boolean2: _fluid = false, boolean3: _opaque = false, boolean4: _sticky = false, boolean5: _adherent = false, name: _mucofluidButtonName = "", name2: _fluidButtonName = "", name3: _opaqueButtonName = "", name4: _stickyButtonName = "", name5: _adherentButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _sticky = true, buttonName: _stickyButtonName = "Pegajoso");
        
                          answer = _stickyButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Pegajoso"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _sticky)
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
                          methods.setFalse(counter: methods.counter, boolean: _mucofluid = false, boolean2: _fluid = false, boolean3: _opaque = false, boolean4: _sticky = false, boolean5: _adherent = false, name: _mucofluidButtonName = "", name2: _fluidButtonName = "", name3: _opaqueButtonName = "", name4: _stickyButtonName = "", name5: _adherentButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _adherent = true, buttonName: _adherentButtonName = "Aderente");
        
                          answer = _adherentButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Aderente"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _adherent)
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