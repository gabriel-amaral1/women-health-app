import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question12.dart';

class Question11 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question11(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question11State createState() => _Question11State();
}

class _Question11State extends State<Question11> {
  var intimateProducts = [];
  
  bool _soap = false;
  bool _lubricant = false;
  bool _flavoring = false;
  bool _none = false;
  bool _other = false;

  String _soapButtonName;
  String _lubricantButtonName;
  String _flavoringButtonName;
  String _noneButtonName;
  String _otherButtonName;

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
              methods.questionFont("Faz uso de algum dos itens abaixo?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _soap = true, buttonName: _soapButtonName = "Sabonete Íntimo");
      
                          answer = _soapButtonName;
                          if(!intimateProducts.contains(_soapButtonName)) {
                            intimateProducts.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Sabonete Íntimo"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _soap)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _lubricant = true, buttonName: _lubricantButtonName = "Lubrificante Íntimo");
      
                          answer = _lubricantButtonName;
                          if(!intimateProducts.contains(_lubricantButtonName)) {
                            intimateProducts.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Lubrificante Íntimo"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _lubricant)
                      ),
                    )
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
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _flavoring = true, buttonName: _flavoringButtonName = "Aromatizantes Íntimos ou similares");
      
                          answer = _flavoringButtonName;
                          if(!intimateProducts.contains(_flavoringButtonName)) {
                            intimateProducts.add(answer);
                          }
                        });
                      }, 
                      child: Text(
                        "Aromatizantes Íntimos ou similares",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontFamily: "Poppins",
                        ),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _flavoring)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _none = true, buttonName: _noneButtonName = "Nenhum");
      
                          answer = _noneButtonName;
                          if(!intimateProducts.contains(_noneButtonName)) {
                            intimateProducts.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Nenhum"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _none)
                      ),
                    )
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
                          methods.setFalse(counter: methods.counter);
    
                          methods.setValues(counter: methods.counter, pressedButton: _other = true, buttonName: _otherButtonName = "Outro");
      
                          answer = _otherButtonName;
                          if(!intimateProducts.contains(_otherButtonName)) {
                            intimateProducts.add(answer);
                          }
                        });
                      }, 
                      child: methods.buttonFont("Outro"),
                     style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _other)
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
            methods.helpFloatingActionButton("helpProductIntimate"),
            methods.nextQuestionFloatingActionButton(context, "Produtos Íntimos", widget.symptomatology, "Produtos Íntimos", Question12(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), intimateProducts),
          ],
        ),
      )
    );
  }
}
