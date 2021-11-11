import 'dart:io';

import 'package:flutter/material.dart';
import 'package:women_health_app/classes/Methods.dart';
import 'package:women_health_app/classes/PDF.dart';
import 'package:women_health_app/screens/UserData.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Methods methods = new Methods();
  var files;
  
  void getFiles() async {
    if (await Permission.storage.request().isGranted) {
      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
      var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
      var fm = FileManager(root: Directory(root)); //
      files = await fm.filesTree( 
        excludedPaths: ["/storage/emulated/0/Android/data/com.app.womenhealth/files"],
        extensions: ["pdf"] //optional, to filter files, list only pdf files
      );
      setState(() {}); //update the UI
    } 
  }

  @override
  void initState() {
    getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: methods.appBarFont("Consultas realizadas")
      ),
      body: files == null? 
      Center(
        child: CircularProgressIndicator(),
      )
      :
      ListView.builder(
        itemCount: files?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            shape: Border.all(color: Colors.black12, width: 1),
            title: Text("${files[index].path.split('/').last}"),
            leading: Icon(Icons.picture_as_pdf),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PDF(files[index].path.toString(), 
                          name: files[index].path.split('/').last.toString().substring(0, files[index].path.split('/').last.toString().length-27), 
                          day: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-26, files[index].path.split('/').last.toString().length-24), 
                          month: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-23, files[index].path.split('/').last.toString().length-21), 
                          year: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-20, files[index].path.split('/').last.toString().length-16), 
                          hour: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-15, files[index].path.split('/').last.toString().length-13), 
                          minute: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-12, files[index].path.split('/').last.toString().length-10), 
                          second: files[index].path.split('/').last.toString().substring(files[index].path.split('/').last.toString().length-7, files[index].path.split('/').last.toString().length-5));
              }));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Theme.of(context).focusColor,
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserData()));
      }, 
      label: methods.floatingActionFont("Nova Consulta"),
      icon: Icon(Icons.add),
      )
    );
  }
}