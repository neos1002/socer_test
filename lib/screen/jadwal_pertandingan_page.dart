import 'package:flutter/material.dart';
import 'package:socer_test/screen/entryform_jadwal_page.dart';
import 'package:socer_test/models/jadwal_pertandingan_model.dart';
import 'package:socer_test/helper/dbhelper_tim.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class JadwalPertandinganMenu extends StatefulWidget {
  @override
  JadwalPertandinganMenuState createState() => JadwalPertandinganMenuState();
}

class JadwalPertandinganMenuState extends State<JadwalPertandinganMenu> {

  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<JadwalPertandinganModel> jadwalPertandinganList;

  @override
  Widget build(BuildContext context) {
    if (jadwalPertandinganList == null) {
      jadwalPertandinganList = List<JadwalPertandinganModel>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pertandingan'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Jadwal Pertandingan',
        onPressed: () async {
          var jadwalPertandingan = await navigateToEntryForm(context, null);
          if (jadwalPertandingan != null) addJadwalPertandingan(jadwalPertandingan);
        },
      ),
    );
  }

  Future<JadwalPertandinganModel> navigateToEntryForm(BuildContext context, JadwalPertandinganModel jadwalPertandingan) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return JadwalPertandinganForm(jadwalPertandingan);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    updateListView();
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(this.jadwalPertandinganList[index].id_team_home.toString()+" VS "+this.jadwalPertandinganList[index].id_team_away.toString(), style: textStyle,),
            subtitle: Text(this.jadwalPertandinganList[index].tanggal_pertandingan +", "+ this.jadwalPertandinganList[index].waktu_pertandingan),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteJadwalPertandingan(jadwalPertandinganList[index]);
              },
            ),
            onTap: () async {
              var jadwalPertandingan = await navigateToEntryForm(context, this.jadwalPertandinganList[index]);
              if (jadwalPertandingan != null) editJadwalPertandingan(jadwalPertandingan);
            },
          ),
        );
      },
    );
  }
  //buat
  void addJadwalPertandingan(JadwalPertandinganModel object) async {
    int result = await dbHelper.insertJP(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit
  void editJadwalPertandingan(JadwalPertandinganModel object) async {
    int result = await dbHelper.updateJP(object);
    if (result > 0) {
      updateListView();
    }
  }
  //delete
  void deleteJadwalPertandingan(JadwalPertandinganModel object) async {
    int result = await dbHelper.deleteJP(object.id);
    if (result > 0) {
      updateListView();
    }
  }
  //update
  void updateListView() {
//    updateListView();
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<JadwalPertandinganModel>> jadwalPertandinganListFuture = dbHelper.getJadwalPertandinganList();
      jadwalPertandinganListFuture.then((jadwalPertandinganList) {
        setState(() {
          this.jadwalPertandinganList = jadwalPertandinganList;
          this.count = jadwalPertandinganList.length;
        });
      });
    });
  }

}