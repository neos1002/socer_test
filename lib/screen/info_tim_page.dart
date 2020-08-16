import 'package:flutter/material.dart';
//letak package folder flutter
import 'package:socer_test/screen/entryform_tim_page.dart';
import 'package:socer_test/models/info_tim_model.dart';
import 'package:socer_test/helper/dbhelper_tim.dart';
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class InfoTimPage extends StatefulWidget {
  @override
  InfoTimPageState createState() => InfoTimPageState();
}

class InfoTimPageState extends State<InfoTimPage> {

  DbHelper dbHelpertim = DbHelper();
  int count = 0;
  List<InfoTimModel> timList;

  @override
  Widget build(BuildContext context) {
    if (timList == null) {
      timList = List<InfoTimModel>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR TIM SEPAK BOLA'),
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

  Future<InfoTimModel> navigateToEntryForm(BuildContext context, InfoTimModel info) async {
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
            title: Text(this.timList[index].nama_tim, style: textStyle,),
            subtitle: Text(this.timList[index].tahun_berdiri),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteTim(timList[index]);
              },
            ),
            onTap: () async {
              var tim = await navigateToEntryForm(context, this.timList[index]);
              if (tim != null) editInfoTim(tim);
            },
          ),
        );
      },
    );
  }
  //buat contact
  void addTim(InfoTimModel object) async {
    int result = await dbHelpertim.insertTim(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit contact
  void editInfoTim(InfoTimModel object) async {
    int result = await dbHelpertim.updateTim(object);
    if (result > 0) {
      updateListView();
    }
  }
  //delete contact
  void deleteTim(InfoTimModel object) async {
    int result = await dbHelpertim.deleteTim(object.id);
    if (result > 0) {
      updateListView();
    }
  }
  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelpertim.initDb();
    dbFuture.then((database) {
      Future<List<InfoTimModel>> timListFuture = dbHelpertim.getTimList();
      timListFuture.then((timList) {
        setState(() {
          this.timList = timList;
          this.count = timList.length;
        });
      });
    });
  }

}