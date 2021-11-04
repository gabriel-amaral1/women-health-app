import 'package:flutter/material.dart';

class Methods {
  int counter = 0;
  double width = 150;
  double height = 50;

  var answer;

  Widget helpFloatingActionButton(String heroTag) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      onPressed: () {},
      label: floatingActionFont("Ajuda"),
      icon: Icon(Icons.help_outline),
      backgroundColor: Color(0xFF00BD9D),
    );
  }

  Widget nextQuestionFloatingActionButton(context, String heroTag, Map map, String symptom, var className, var answer) {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).focusColor,
      heroTag: heroTag,
      onPressed: () {
        map[symptom] = answer;
        print(map.toString());
        nextPage(context, className);
      },
      label: floatingActionFont("Próx. Pergunta"),
      icon: Icon(Icons.arrow_forward),
    );
  }

  Widget appBarFont(String name) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: "Open Sans",
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget floatingActionFont(String name) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: "Ubuntu",
        fontSize: 14.5,
        fontWeight: FontWeight.w500
      ),
    );
  }

  Widget questionFont(String name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 22.5, 
        letterSpacing: 1
      ),
    );
  }

  Widget buttonFont(String name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.9,
        fontFamily: "Poppins",
      ),
    );
  }

  isSelected(context, var globalButton) {
    if (globalButton) {
      return MaterialStateProperty.all(Color(0xFF7A7A7A));
    }

    return MaterialStateProperty.all(Color(0xFF040404));
  }

  setFalse({int counter = 0, bool boolean = false, bool boolean2 = false, bool boolean3 = false, bool boolean4 = false, bool boolean5 = false, bool boolean6 = false, bool boolean7 = false, bool boolean8 = false, bool boolean9 = false, bool boolean10 = false, String name = "", String name2 = "", String name3 = "", String name4 = "", String name5 = "", String name6 = "", String name7 = "", String name8 = "", String name9 = "", String name10 = "",}) {
    this.counter = 0;
  }

  setValues({int counter = 0, bool pressedButton = true, String buttonName = ""}) {
    this.counter++;
  }


  nextPage(context, var className) {
    if (counter == 1) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => className));
    }

    else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Atenção!"),
          content: Text("Selecione uma opção para continuar."),
          actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text("OK")
            )
          ],
        );
      });
    }
  }

  finalResult(Map map, {var name}) {
    Map result = new Map<String, dynamic>();
    if(map["Cor"] == "Transparente" && map["Odor"] == "Inodor" && map["Consistência"] == "Opaco") {
      result["Sugestões"] = "Vá ao médico.";
      result["Orientações"] = "Beba mais água.";
      return result[name];
    }
  }
}