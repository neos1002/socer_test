import 'package:flutter/material.dart';
import 'package:socer_test/models/info_pemain_model.dart';

class EntryForm extends StatefulWidget {
  final InfoPemainModel pemainModel;

  EntryForm(this.pemainModel);

  @override
  EntryFormState createState() => EntryFormState(this.pemainModel);
}
//class controller
class EntryFormState extends State<EntryForm> {
  InfoPemainModel pemainModel;

  EntryFormState(this.pemainModel);

  TextEditingController nama_pemain_Controller = TextEditingController();
  TextEditingController  tinggi_badan_controller= TextEditingController();
  TextEditingController berat_badan_Controller = TextEditingController();
  TextEditingController posisi_pemain_Controller = TextEditingController();
  TextEditingController nomor_punggung_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (pemainModel != null) {
      nama_pemain_Controller.text = pemainModel.nama_pemain;
      tinggi_badan_controller.text = pemainModel.tinggi_badan;
      berat_badan_Controller.text = pemainModel.berat_badan;
      posisi_pemain_Controller.text = pemainModel.posisi_pemain;
      nomor_punggung_Controller.text = pemainModel.nomor_punggung;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: pemainModel == null ? Text('Tambah') : Text('Rubah'),
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
                  controller: nama_pemain_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Pemain Sepak Bola',
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
                  controller: tinggi_badan_controller,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Tinggi Badan Pemain',
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
                  controller: berat_badan_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Berat Badan Pemain',
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
                  controller: posisi_pemain_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Posisi Pemain',
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
                  controller: nomor_punggung_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nomor Punggung Pemain',
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
                          if (pemainModel == null) {
                            // tambah data
                            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa dari entryform_tim_page check" );
                            print(nama_pemain_Controller.text);
                            pemainModel = InfoPemainModel(nama_pemain_Controller.text, tinggi_badan_controller.text, berat_badan_Controller.text, posisi_pemain_Controller.text, nomor_punggung_Controller.text);
                          } else {
                            // ubah data
                            pemainModel.nama_pemain = nama_pemain_Controller.text;
                            pemainModel.tinggi_badan = tinggi_badan_controller.text;
                            pemainModel.berat_badan = berat_badan_Controller.text;
                            pemainModel.posisi_pemain = posisi_pemain_Controller.text;
                            pemainModel.nomor_punggung = nomor_punggung_Controller.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, pemainModel);
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