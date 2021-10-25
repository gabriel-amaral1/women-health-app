import 'package:flutter/material.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Question5.dart';


class Question4 extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  Question4(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  bool _vulva = false;
  bool _vaginalWalls = false;
  bool _cervix = false;
  bool _endocervix = false;

  String _vulvaButtonName;
  String _vaginalWallsButtonName;
  String _cervixButtonName;
  String _endocervixButtonName;

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
              methods.questionFont("Onde está localizado o corrimento vaginal?"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _vulva = false, boolean2: _vaginalWalls = false, boolean3: _cervix = false, boolean4: _endocervix = false, name: _vulvaButtonName = "", name2: _vaginalWallsButtonName = "", name3: _cervixButtonName = "", name4: _endocervixButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _vulva = true, buttonName: _vulvaButtonName = "Vulva");
        
                          answer = _vulvaButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Vulva"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _vulva)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _vulva = false, boolean2: _vaginalWalls = false, boolean3: _cervix = false, boolean4: _endocervix = false, name: _vulvaButtonName = "", name2: _vaginalWallsButtonName = "", name3: _cervixButtonName = "", name4: _endocervixButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _vaginalWalls = true, buttonName: _vaginalWallsButtonName = "Paredes Vaginais");
        
                          answer = _vaginalWallsButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Paredes Vaginais"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _vaginalWalls)
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
                          methods.setFalse(counter: methods.counter, boolean: _vulva = false, boolean2: _vaginalWalls = false, boolean3: _cervix = false, boolean4: _endocervix = false, name: _vulvaButtonName = "", name2: _vaginalWallsButtonName = "", name3: _cervixButtonName = "", name4: _endocervixButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _cervix = true, buttonName: _cervixButtonName = "Colo de Útero");
        
                          answer = _cervixButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Colo de Útero"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _cervix)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          methods.setFalse(counter: methods.counter, boolean: _vulva = false, boolean2: _vaginalWalls = false, boolean3: _cervix = false, boolean4: _endocervix = false, name: _vulvaButtonName = "", name2: _vaginalWallsButtonName = "", name3: _cervixButtonName = "", name4: _endocervixButtonName = "");
    
                          methods.setValues(counter: methods.counter, pressedButton: _endocervix = true, buttonName: _endocervixButtonName = "Endocérvice");
        
                          answer = _endocervixButtonName;
                        });
                      }, 
                      child: methods.buttonFont("Endocérvice"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(methods.width, methods.height)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: methods.isSelected(context, _endocervix)
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
            methods.helpFloatingActionButton("helpLocation"),
            methods.nextQuestionFloatingActionButton(context, "locationQuestion", widget.symptomatology, "Localização", Question5(widget.symptomatology, widget.name, widget.cpf, widget.address, widget.healthUnitRecord, widget.susCard), answer),
          ],
        ),
      )
    );
  }
}
