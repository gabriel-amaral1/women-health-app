import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gconsult/classes/Methods.dart';
import 'package:gconsult/classes/PDF.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class FinalResult extends StatefulWidget {
  final symptomatology, name, cpf, address, healthUnitRecord, susCard;
  FinalResult(this.symptomatology, this.name, this.cpf, this.address, this.healthUnitRecord, this.susCard);

  @override
  _FinalResultState createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  static const platform = const MethodChannel("com.gconsultmobile.app/app");

  var day = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;

  final pdf = pdfWidgets.Document();

  Methods methods = new Methods();

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

                pdfWidgets.Paragraph(
                  text: "Data: $day/$month/$year".toUpperCase()
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
                  text: "Horário: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}".toUpperCase()
                ),
              ]
            ),

            pdfWidgets.Row(
              mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
              children: [
                pdfWidgets.Paragraph(
                  text: "Endereço: ${widget.address}".toUpperCase()
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
                  text: "Registro na Unidade de Saúde: ${widget.healthUnitRecord}".toUpperCase()
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
                          child: pdfWidgets.Text(widget.symptomatology["Cor"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Odor"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Consistência"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Localização"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Quantidade"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Dor Relações Sexuais"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Sangramentos Intermenstruais"]),
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
                          child: pdfWidgets.Text(widget.symptomatology["Disúria"]),
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
                              pdfWidgets.Text(widget.symptomatology["Métodos Contraceptivos"].toString().substring(1, widget.symptomatology["Métodos Contraceptivos"].toString().length-1))
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
                          child: pdfWidgets.Text(widget.symptomatology["Produtos Íntimos"].toString().substring(1, widget.symptomatology["Produtos Íntimos"].toString().length-1)),
                        ),
                      ]
                    )
                  ]
                ),
              ]
            )
          ];
        }
      )
    );
  }

  Future savePdf() async {
    Directory documentDirectory = await getExternalStorageDirectory();

    String documentPath = documentDirectory.path;
    File file = File("$documentPath/${widget.name}.pdf");

    file.writeAsBytesSync(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: methods.appBarFont("Resultado")
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
                          widget.symptomatology["Cor"],
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
                          widget.symptomatology["Odor"],
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
                          widget.symptomatology["Consistência"],
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
                          widget.symptomatology["Localização"],
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
                          widget.symptomatology["Quantidade"],
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
                          widget.symptomatology["Dor Relações Sexuais"],
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
                          widget.symptomatology["Sangramentos Intermenstruais"],
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
                          widget.symptomatology["Disúria"],
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
                          widget.symptomatology["Métodos Contraceptivos"].toString().substring(1, widget.symptomatology["Métodos Contraceptivos"].toString().length-1),
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
                          widget.symptomatology["Produtos Íntimos"].toString().substring(1, widget.symptomatology["Produtos Íntimos"].toString().length-1),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 25, bottom: 5),
              //   child: Text(
              //     "Sugestões:",
              //     textAlign: TextAlign.start,
              //     style: TextStyle(
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
              // Text(
              //     "Tratamentos preventivos:",
              //     textAlign: TextAlign.start,
              //     style: TextStyle(
              //       fontSize: 15,
              //     ),
              //   ),
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
            .doc(widget.name + " - " + DateTime.now().day.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().year.toString())
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
              });
          
          writeOnPdf();
          savePdf();

          Directory documentDirectory = await getExternalStorageDirectory();

          String documentPath = documentDirectory.path;
          String fullPath = "$documentPath/${widget.name.toString().toUpperCase()}.pdf";

          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => PDF(fullPath, name: widget.name)));

          javaRules();
        },
        label: methods.floatingActionFont("Finalizar")
      ), 
        
    );
  }

  javaRules() async {
    var rules = <String, dynamic> {
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
    };

    String value;

    try {
      value = await platform.invokeMethod("javaRules", rules);
    } catch (e) {
      print(e);
    }

    print(value);
  }
}