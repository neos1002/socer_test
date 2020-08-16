import 'package:flutter/material.dart';
import 'package:socer_test/models/info_pemain_model.dart';
import 'package:socer_test/screen/entryform_Pemain_page.dart';
import 'package:socer_test/helper/dbhelper_tim.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
//pendukung program asinkron

class InfoPemainPage extends StatefulWidget {
  @override
  InfoPemainPageState createState() => InfoPemainPageState();
}

class InfoPemainPageState extends State<InfoPemainPage> {
  DbHelper dbHelperPemain = DbHelper();
  int count = 0;
  List<InfoPemainModel> pemainList;

  @override
  Widget build(BuildContext context) {
    if (pemainList == null) {
      pemainList = List<InfoPemainModel>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR Pemain SEPAK BOLA'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var tim = await navigateToEntryForm(context, null);
          if (tim != null) addTim(tim);
        },
      ),
    );
  }

  Future<InfoPemainModel> navigateToEntryForm(BuildContext context, InfoPemainModel info) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(info);
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
              child: Icon(Icons.train),
            ),
            title: Text(this.pemainList[index].nama_pemain, style: textStyle,),
            subtitle: Text(this.pemainList[index].id_tim.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteTim(pemainList[index]);
              },
            ),
            onTap: () async {
              var tim = await navigateToEntryForm(context, this.pemainList[index]);
              if (tim != null) editInfoTim(tim);
            },
          ),
        );
      },
    );
  }
  //buat contact
  void addTim(InfoPemainModel object) async {
    int result = await dbHelperPemain.insertPemain(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit contact
  void editInfoTim(InfoPemainModel object) async {
    int result = await dbHelperPemain.updatePemain(object);
    if (result > 0) {
      updateListView();
    }
  }
  //delete contact
  void deleteTim(InfoPemainModel object) async {
    int result = await dbHelperPemain.deleteTim(object.id);
    if (result > 0) {
      updateListView();
    }
  }
  void updateListView() {
    final Future<Database> dbFuture = dbHelperPemain.initDb();
    dbFuture.then((database) {
      Future<List<InfoPemainModel>> pemainListFuture = dbHelperPemain.getPemainList();
      pemainListFuture.then((pemainList) {
        setState(() {
          this.pemainList = pemainList;
          this.count = pemainList.length;
        });
      });
    });
  }

}