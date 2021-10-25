import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question2.dart';

class Question1 extends StatefulWidget {
  final name, cpf, address, healthUnitRecord, susCard;
  Question1(this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  Map result = new Map<String, dynamic>();

  bool _transparent = false; 
  bool _whitish = false;

  bool _yellowish = false;
  bool _greenishYellow = false;
  bool _grayYellow = false;
  bool _other = false;

  String _transparentButtonName;
  String _whitishButtonName;
  String _yellowishButtonName;
  String _greenishYellowButtonName;
  String _grayYellowButtonName;
  String _otherButtonName;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: methods.questionFont("Qual a cor do corrimento vaginal?")
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _transparent = true, buttonName: _transparentButtonName = "Transparente");
    
                        answer = _transparentButtonName;
                      });
                    },
                    child: methods.buttonFont("Transparente"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)), 
                      elevation: MaterialStateProperty.all(5), 
                      backgroundColor: methods.isSelected(context, _transparent)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _whitish = true, buttonName: _whitishButtonName = "Esbranquiçado");
    
                        answer = _whitishButtonName;
                      });
                    },
                    child: methods.buttonFont("Esbranquiçado"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)), 
                      elevation: MaterialStateProperty.all(5), 
                      backgroundColor: methods.isSelected(context, _whitish)
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _yellowish = true, buttonName: _yellowishButtonName = "Amarelado");
    
                        answer = _yellowishButtonName;
                      });
                    },
                    child: methods.buttonFont("Amarelado"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: methods.isSelected(context, _yellowish),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _greenishYellow = true, buttonName: _greenishYellowButtonName = "Amarelo/Esverdeado");
    
                        answer = _greenishYellowButtonName;
                      });
                    },
                    child: methods.buttonFont("Amarelo/Esverdeado"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: methods.isSelected(context, _greenishYellow),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _grayYellow = true, buttonName: _grayYellowButtonName = "Amarelo/Acizentado");
    
                        answer = _grayYellowButtonName;
                      });
                    },
                    child: methods.buttonFont("Amarelo/Acizentado"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: methods.isSelected(context, _grayYellow),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        methods.setFalse(counter: methods.counter, boolean: _transparent = false, boolean2: _whitish = false, boolean3: _yellowish = false, boolean4: _greenishYellow = false, boolean5: _grayYellow = false , boolean6: _other = false, name: _transparentButtonName = "", name2: _whitishButtonName = "", name3: _yellowishButtonName = "", name4: _greenishYellowButtonName = "", name5: _grayYellowButtonName = "", name6: _otherButtonName = "");
    
                        methods.setValues(counter: methods.counter, pressedButton: _other = true, buttonName: _otherButtonName = "Outro");
    
                        answer = _otherButtonName;
                      });
                    },
                    child: methods.buttonFont("Outro"),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: methods.isSelected(context, _other),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              methods.helpFloatingActionButton("helpColor"),
              methods.nextQuestionFloatingActionButton(context, "colorQuestion", result, "Cor", Question2(result, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer)
            ],
          )),
    );
  }
}
