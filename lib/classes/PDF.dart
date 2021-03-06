import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:path_provider/path_provider.dart';

class PDF extends StatefulWidget {
  final String path, name, day, month, year, hour, minute, second;
  PDF(this.path, {this.name, this.day, this.month, this.year, this.hour, this.minute, this.second});
  
  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  @override
  Widget build(BuildContext context) {

    Methods methods = new Methods();

    return PDFViewerScaffold(
        path: widget.path,
        appBar: AppBar(
          title: methods.appBarFont("PDF"),
          actions: [
            IconButton(
              onPressed: () async {
                Directory documentDirectory = await getExternalStorageDirectory();
                String documentPath = documentDirectory.path;
                File file = File("$documentPath/${widget.name.toUpperCase()} ${widget.day}-${widget.month}-${widget.year} ${widget.hour}h${widget.minute}min${widget.second}s.pdf");

                var sharePdf = await file.readAsBytes();
                await Share.file(
                  'PDF Document',
                  '${widget.name.toUpperCase()} ${widget.day}-${widget.month}-${widget.year} ${widget.hour}h${widget.minute}min${widget.second}s.pdf',
                  sharePdf.buffer.asUint8List(),
                  '*/*',
                );
              }, 
              icon: Icon(Icons.share)
            ),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              }, 
              icon: Icon(Icons.close)
            )
          ],
        ),
    );
  }
}