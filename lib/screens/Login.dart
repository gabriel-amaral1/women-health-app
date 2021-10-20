import 'package:flutter/material.dart';
import 'package:gconsult/screens/Home.dart';

class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Usuário",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      //print("Login efetuado com sucesso!");
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Home()
                        ),
                      );
                    }, 
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}