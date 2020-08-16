import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socer_test/models/jadwal_pertandingan_model.dart';

class JadwalPertandinganForm extends StatefulWidget {
  final JadwalPertandinganModel jadwalPertandingan;

  JadwalPertandinganForm(this.jadwalPertandingan);

  @override
  JadwalPertandinganFormState createState() => JadwalPertandinganFormState(this.jadwalPertandingan);
}
//class controller
class JadwalPertandinganFormState extends State<JadwalPertandinganForm> {
  JadwalPertandinganModel jadwalPertandingan;

  JadwalPertandinganFormState(this.jadwalPertandingan);

  TextEditingController tanggalPertandinganController = TextEditingController();
  TextEditingController waktuPertandinganController = TextEditingController();
  TextEditingController idTeamHomeController = TextEditingController();
  TextEditingController idTeamAwayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (jadwalPertandingan != null) {
      tanggalPertandinganController.text = jadwalPertandingan.tanggal_pertandingan;
      waktuPertandinganController.text = jadwalPertandingan.waktu_pertandingan;
      idTeamHomeController.text = jadwalPertandingan.id_team_home.toString();
      idTeamAwayController.text = jadwalPertandingan.id_team_away.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: jadwalPertandingan == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              // Tanggal
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: tanggalPertandinganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Pertandingan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // Waktu
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: waktuPertandinganController,
                  keyboardType: TextInputType.text
                  ,
                  decoration: InputDecoration(
                    labelText: 'Waktu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // Tim Home
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: idTeamHomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Home Team',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // Tim Away
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: idTeamAwayController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Away Team',
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
                          if (jadwalPertandingan == null) {
                            // tambah data
                            jadwalPertandingan = JadwalPertandinganModel(tanggalPertandinganController.text,waktuPertandinganController.text,int.parse(idTeamHomeController.text),int.parse(idTeamAwayController.text));
                          } else {
                            // ubah data
                            jadwalPertandingan.tanggal_pertandingan = tanggalPertandinganController.text;
                            jadwalPertandingan.waktu_pertandingan = waktuPertandinganController.text;
                            jadwalPertandingan.id_team_home = int.parse(idTeamHomeController.text);
                            jadwalPertandingan.id_team_away = int.parse(idTeamAwayController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, jadwalPertandingan);
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