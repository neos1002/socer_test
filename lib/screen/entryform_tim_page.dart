import 'package:flutter/material.dart';
import 'package:socer_test/models/info_tim_model.dart';
import 'package:socer_test/models/info_pemain_model.dart';

class EntryForm extends StatefulWidget {
  final InfoTimModel timModel;

  EntryForm(this.timModel);

  @override
  EntryFormState createState() => EntryFormState(this.timModel);
}
//class controller
class EntryFormState extends State<EntryForm> {
  InfoTimModel timModel;

  EntryFormState(this.timModel);

  TextEditingController nama_tim_Controller = TextEditingController();
  TextEditingController  tahun_beridiri_controller= TextEditingController();
  TextEditingController alamat_markas_Controller = TextEditingController();
  TextEditingController kota_markas_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (timModel != null) {
      nama_tim_Controller.text = timModel.nama_tim;
      tahun_beridiri_controller.text = timModel.tahun_berdiri;
      alamat_markas_Controller.text = timModel.alamat_markas;
      kota_markas_Controller.text = timModel.kota_markas;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: timModel == null ? Text('Tambah') : Text('Rubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              // nama
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nama_tim_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Tim Sepak Bola',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // telepon
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: tahun_beridiri_controller,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Tahun Berdiri Tim',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: alamat_markas_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat Markas Tim',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: kota_markas_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kota Markas Tim',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // tombol button
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: Row(
                  children: <Widget> [
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (timModel == null) {
                            // tambah data
                            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa dari entryform_tim_page check" );
                            print(nama_tim_Controller.text);
                            timModel = InfoTimModel(nama_tim_Controller.text, tahun_beridiri_controller.text, alamat_markas_Controller.text, kota_markas_Controller.text);
                          } else {
                            // ubah data
                            timModel.nama_tim = nama_tim_Controller.text;
                            timModel.tahun_berdiri = tahun_beridiri_controller.text;
                            timModel.alamat_markas = alamat_markas_Controller.text;
                            timModel.kota_markas = kota_markas_Controller.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, timModel);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}