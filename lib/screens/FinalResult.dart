import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/classes/PDF.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class FinalResult extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard, suggestion, treatment, result;
  FinalResult(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard, {this.suggestion, this.treatment, this.result});

  @override
  _FinalResultState createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  var day = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;
  var hour = DateTime.now().hour;
  var minute = DateTime.now().minute;
  var second = DateTime.now().second;

  String homeDay;
  String homeMonth;
  String homeHour;
  String homeMinute;
  String homeSecond;

  final pdf = pdfWidgets.Document();

  Methods methods = new Methods();

  time() {
    if(DateTime.now().hour < 10) {
      if(DateTime.now().minute < 10) {
        return "Horário: 0${DateTime.now().hour}:0${DateTime.now().minute}".toUpperCase();
      }
      return "Horário: 0${DateTime.now().hour}:${DateTime.now().minute}".toUpperCase();
    }

    if(DateTime.now().minute < 10) {
      if(DateTime.now().hour < 10) {
        return "Horário: 0${DateTime.now().hour}:0${DateTime.now().minute}".toUpperCase();
      }
      return "Horário: ${DateTime.now().hour}:0${DateTime.now().minute}".toUpperCase();
    }

    else {
      return "Horário: ${DateTime.now().hour}:${DateTime.now().minute}".toUpperCase();
    }
  }

  date() {
    if(DateTime.now().day < 10) {
      if(DateTime.now().month < 10) {
        return "Data: 0${DateTime.now().day}/0${DateTime.now().month}/${DateTime.now().year}".toUpperCase();
      }
      return "Data: 0${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}".toUpperCase();
    }

    if(DateTime.now().month < 10) {
      if(DateTime.now().day < 10) {
        return "Data: 0${DateTime.now().day}/0${DateTime.now().month}/${DateTime.now().year}".toUpperCase();
      }
      return "Data: ${DateTime.now().day}/0${DateTime.now().month}/${DateTime.now().year}".toUpperCase();
    }

    else {
      return "Data: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}".toUpperCase();
    }
  }

  writeOnPdf() {
    pdf.addPage(
      pdfWidgets.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pdfWidgets.EdgeInsets.all(32),
        build: (pdfWidgets.Context context) {
          return [
            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: "Nome Completo: ${widget.name}".toUpperCase()
                ),
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: "CPF: ${widget.cpf}".toUpperCase()
                ),

                pdfWidgets.Paragraph(
                  text: date()
                ),

                pdfWidgets.Paragraph(
                  text: time()
                ),
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: "Registro na Unidade de Saúde: ${widget.healthUnitRecord}".toUpperCase()
                ),

                pdfWidgets.Paragraph(
                  text: "Cartão do SUS: ${widget.susCard}".toUpperCase()
                ),
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: "Endereço: ${widget.address}".toUpperCase()
                ),
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: ""
                ),
              ]
            ),
            
            pdfWidgets.Table(
              border: pdfWidgets.TableBorder.all(
                color: PdfColors.black, 
                width: 1, 
                style: pdfWidgets.BorderStyle.solid
              ),
              children: [
                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Column(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Column(
                            children: [
                              pdfWidgets.Text(
                              "SINTOMA",
                              style: pdfWidgets.TextStyle(
                                fontWeight: pdfWidgets.FontWeight.bold
                              )
                              ),
                            ]
                          )
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Column(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Column(
                            children: [
                              pdfWidgets.Text(
                              "RESPOSTA",
                              style: pdfWidgets.TextStyle(
                                fontWeight: pdfWidgets.FontWeight.bold
                              )
                              ),
                            ]
                          )
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("COR"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Cor"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("ODOR"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Odor"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("CONSISTÊNCIA"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Consistência"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("LOCALIZAÇÃO"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Localização"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("QUANTIDADE"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Quantidade"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Column(
                      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("DOR NAS RELAÇÕES SEXUAIS"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Dor Relações Sexuais"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Column(
                      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("SANGRAMENTOS INTERMENSTRUAIS"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Sangramentos Intermenstruais"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("DISÚRIA"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Row(
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Disúria"].toString().toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Column(
                      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("MÉTODOS CONTRACEPTIVOS"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Padding(
                      padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                      child: pdfWidgets.Column(
                        crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                        children: [
                          pdfWidgets.Column(
                            children: [
                              pdfWidgets.Text(widget.symptomatology["Métodos Contraceptivos"].toString().substring(1, widget.symptomatology["Métodos Contraceptivos"].toString().length-1).toUpperCase())
                            ]
                          ),
                          
                      ]
                    ))
                  ]
                ),

                pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Column(
                      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text("PRODUTOS ÍNTIMOS"), 
                        ),
                        
                      ]
                    ),
                    pdfWidgets.Column(
                      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
                      children: [
                        pdfWidgets.Padding(
                          padding: pdfWidgets.EdgeInsets.fromLTRB(5, 2, 2, 5),
                          child: pdfWidgets.Text(widget.symptomatology["Produtos Íntimos"].toString().substring(1, widget.symptomatology["Produtos Íntimos"].toString().length-1).toUpperCase()),
                        ),
                      ]
                    )
                  ]
                ),    
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: ""
                ),
              ]
            ),

             pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: ""
                ),
              ]
            ),

            pdfWidgets.Row(
              children: [
                pdfWidgets.Paragraph(
                  text: "Sugestões: ${methods.finalResult(widget.symptomatology, name: "Sugestões")}".toUpperCase()
                ),
              ]
            ),

            pdfWidgets.Row(
              children: [
                pdfWidgets.Paragraph(
                  text: "Orientações: ${methods.finalResult(widget.symptomatology, name: "Orientações")}".toUpperCase()
                ),
              ]
            ),
          ];
        }
      )
    );
  }

  homeVars() {
    homeDay = day.toString();
    homeMonth = month.toString();
    homeHour = hour.toString();
    homeMinute = minute.toString();
    homeSecond = second.toString();

    //Date

     if(day < 10) {
        homeDay = "0" + day.toString();
    }

     if(month < 10) {
        homeMonth = "0" + month.toString();
    }

    // End of Date

    // Time

    if(hour < 10) {
      homeHour = "0" + hour.toString();
    }

    if(minute < 10) {
      homeMinute = "0" + minute.toString();
    }

    if(second < 10) {
      homeSecond = "0" + second.toString();
    }

    // End of Time

    print("Day: " + homeDay);
    print("Month: " + homeMonth);
    print("Hour: " + homeHour);
    print("Minute: " + homeMinute);
    print("Second: " + homeSecond);
  }

  Future savePdf() async {
    Directory documentDirectory = await getExternalStorageDirectory();

    homeVars();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/${widget.name.toUpperCase()} $homeDay-$homeMonth-$year ${homeHour}h${homeMinute}min${homeSecond}s.pdf");

    file.writeAsBytesSync(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: methods.appBarFont("Resultado"),
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
        child: Container(
          padding: EdgeInsets.fromLTRB(32, 32, 32, 96),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Respostas",
                  style: TextStyle(
                    fontSize: 19
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: Text(
                  "Confira se todas as informações preenchidas estão corretas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Nome Completo: ${widget.name}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "CPF: ${widget.cpf}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Endereço: ${widget.address}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Cartão do SUS: ${widget.susCard}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Registro na Unidade de Saúde: ${widget.healthUnitRecord}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
              Table(
                border: TableBorder.all(color: Colors.black, width: 1),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "SINTOMA",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "RESPOSTA",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "COR",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Cor"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "ODOR",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Odor"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "CONSISTÊNCIA",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Consistência"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "LOCALIZAÇÃO",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Localização"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "QUANTIDADE",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Quantidade"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "DOR NAS RELAÇÕES SEXUAIS",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Dor Relações Sexuais"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "SANGRAMENTOS INTERMENSTRUAIS",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Sangramentos Intermenstruais"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "DISÚRIA",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Disúria"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "MÉTODOS CONTRACEPTIVOS",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Métodos Contraceptivos"].toString().substring(1, widget.symptomatology["Métodos Contraceptivos"].toString().length-1).toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "PRODUTOS ÍNTIMOS",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.symptomatology["Produtos Íntimos"].toString().substring(1, widget.symptomatology["Produtos Íntimos"].toString().length-1).toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 5),
                child: Text(
                  "Sugestões: ${methods.finalResult(widget.symptomatology, name: "Sugestões")}".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                  "Orientações: ${methods.finalResult(widget.symptomatology, name: "Orientações")}".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF718F94),
        onPressed: () async {
          await Firebase.initializeApp();
          FirebaseFirestore db = FirebaseFirestore.instance;
                  
          db.collection("pacientes")
            .doc(widget.name + " - " + DateTime.now().day.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().year.toString() + " " + time().toString().substring(8, time().toString().length))
            .set(
              {
                "Cor": widget.symptomatology["Cor"],
                "Odor": widget.symptomatology["Odor"],
                "Consistência": widget.symptomatology["Consistência"],
                "Localização": widget.symptomatology["Localização"],
                "Quantidade": widget.symptomatology["Quantidade"],
                "Dor nas Relações Sexuais": widget.symptomatology["Dor Relações Sexuais"],
                "Sangramentos Intermenstruais": widget.symptomatology["Sangramentos Intermenstruais"],
                "Disúria": widget.symptomatology["Disúria"],
                "Métodos Contraceptivos": widget.symptomatology["Métodos Contraceptivos"],
                "Produtos Íntimos": widget.symptomatology["Produtos Íntimos"],
                "Sugestões": methods.finalResult(widget.symptomatology, name: "Sugestões"),
                "Orientações": methods.finalResult(widget.symptomatology, name: "Orientações"),
              });

          writeOnPdf();
          savePdf();
          homeVars();
          
          Directory documentDirectory = await getExternalStorageDirectory();

          String documentPath = documentDirectory.path;
          String fullPath = "$documentPath/${widget.name.toUpperCase()} $homeDay-$homeMonth-$year ${homeHour}h${homeMinute}min${homeSecond}s.pdf";

          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => PDF(fullPath, name: widget.name, day: homeDay, month: homeMonth, year: year.toString(), hour: homeHour, minute: homeMinute, second: homeSecond,)));
        },
        label: methods.floatingActionFont("Finalizar")
      ), 
        
    );
  }
}