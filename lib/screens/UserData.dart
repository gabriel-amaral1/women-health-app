import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart' as cpfValidator;
import 'package:women_health_app/screens/Question1.dart'; 
 


class UserData extends StatefulWidget {
  const UserData({ Key key }) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  TextEditingController patientName = new TextEditingController();
  TextEditingController healthUnitRecord = new TextEditingController();
  TextEditingController susCard = new TextEditingController();
  TextEditingController cpf = new TextEditingController();
  TextEditingController address = new TextEditingController();

  Methods methods = new Methods();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Sintomatologia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w600
          ),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Text(
                    "Dados Pessoais",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Nome Completo",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).disabledColor,
                  ),
                  style: TextStyle(),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Digite o nome da paciente.";
                    }
                    return value;
                  },
                  controller: patientName,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.file_copy),
                      hintText: "CPF",
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).disabledColor
                    ),
                    style: TextStyle(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    validator: (value) {
                      if(value == null || value.isEmpty || cpfValidator.CPFValidator.isValid(value) == false) {
                        return "Digite um CPF válido.";
                      }
                      return value;
                    },
                    controller: cpf,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.add_location),
                      hintText: "Endereço",
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).disabledColor
                    ),
                    style: TextStyle(),
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Digite um endereço válido.";
                      }
                      return value;
                    },
                    controller: address,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.local_hospital),
                      hintText: "Registro na Unidade de Saúde",
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).disabledColor
                    ),
                    style: TextStyle(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Digite um registro válido.";
                      }
                      return value;
                    },
                    controller: healthUnitRecord,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.credit_card),
                      hintText: "Cartão do SUS",
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).disabledColor,
                    ),
                    style: TextStyle(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Digite um cartão do SUS válido.";
                      }
                      return value;
                    },
                    controller: susCard,
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).focusColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
          }
          Navigator.pop(context);
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => Question1(patientName.text, cpf.text, address.text, healthUnitRecord.text, susCard.text)
            ),
          );
        }, 
        label: methods.floatingActionFont("Próx."),
        icon: Icon(Icons.arrow_forward)
      ),     
    );
  }
}