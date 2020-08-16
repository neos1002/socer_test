import 'package:flutter/material.dart';
import 'package:socer_test/screen/jadwal_pertandingan_page.dart';
import 'package:socer_test/screen/info_pemain_page.dart';
import 'package:socer_test/screen/info_tim_page.dart';

class MainMenu extends StatefulWidget{
  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Soccer Management"),
      ),
      body: ListView(
        children: <Widget> [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    elevation: 24,
                    child: ListTile(
                      leading: Icon(Icons.group),
                      title: Text("Pengelolaan Team"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTimPage()));
                      },
                    ),
                  ),
                  Card(
                    elevation: 24,
                    child: ListTile(
                      leading: Icon(Icons.contacts),
                      title: Text("Pengelolaan Pemain"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPemainPage()));
                      },
                    ),
                  ),
                  Card(
                    elevation: 24,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("Pengelolaan Jadwal"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JadwalPertandinganMenu()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}