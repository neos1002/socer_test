import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:socer_test/models/info_tim_model.dart';
import 'package:socer_test/models/info_pemain_model.dart';
import 'package:socer_test/models/jadwal_pertandingan_model.dart';


class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'socer.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE info_team (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_tim TEXT,
        tahun_berdiri TEXT,
        alamat_markas TEXT,
        kota_markas TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE info_pemain (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_pemain TEXT,
        tinggi_badan TEXT,
        berat_badan TEXT,
        posisi_pemain TEXT,
        nomor_punggung TEXT,
        id_tim INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE jadwal_pertandingan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tanggal_pertandingan TEXT,
        waktu_pertandingan TEXT,
        id_team_home INTEGER,
        id_team_away INTEGER
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> selectTim() async {
    Database db = await this.database;
    var mapList = await db.query('info_team', orderBy: 'nama_tim');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectPemain() async {
    Database db = await this.database;
    var mapList = await db.query('info_pemain', orderBy: 'nama_pemain');
    return mapList;
  }

//create databases
  Future<int> insertTim(InfoTimModel object) async {
    Database db = await this.database;
    int count = await db.insert('info_team', object.toMap());
    return count;
  }

  Future<int> insertPemain(InfoPemainModel object) async {
    Database db = await this.database;
    int count = await db.insert('info_pemain', object.toMap());
    return count;
  }
//update databases
  Future<int> updateTim(InfoTimModel object) async {
    Database db = await this.database;
    int count = await db.update('info_team', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

  Future<int> updatePemain(InfoPemainModel object) async {
    Database db = await this.database;
    int count = await db.update('info_pemain', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> deleteTim(int id) async {
    Database db = await this.database;
    int count = await db.delete('info_team',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<int> deletePemain(int id) async {
    Database db = await this.database;
    int count = await db.delete('info_pemain',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<InfoTimModel>> getTimList() async {
    var timMapList = await selectTim();
    int count = timMapList.length;
    List<InfoTimModel> timList = List<InfoTimModel>();
    for (int i=0; i<count; i++) {
      timList.add(InfoTimModel.fromMap(timMapList[i]));
    }
    return timList;
  }

  Future<List<InfoPemainModel>> getPemainList() async {
    var pemainMapList = await selectPemain();
    int count = pemainMapList.length;
    List<InfoPemainModel> pemainList = List<InfoPemainModel>();
    for (int i=0; i<count; i++) {
      pemainList.add(InfoPemainModel.fromMap(pemainMapList[i]));
    }
    return pemainList;
  }
  Future<List<Map<String, dynamic>>> selectJP() async {
    Database db = await this.database;
    var mapList = await db.query('jadwal_pertandingan', orderBy: 'id');
    return mapList;
  }

  Future<int> insertJP(JadwalPertandinganModel object) async {
    Database db = await this.database;
    int count = await db.insert('jadwal_pertandingan', object.toMap());
    return count;
  }

  Future<int> updateJP(JadwalPertandinganModel object) async {
    Database db = await this.database;
    int count = await db.update('jadwal_pertandingan', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

  Future<int> deleteJP(int id) async {
    Database db = await this.database;
    int count = await db.delete('jadwal_pertandingan',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<JadwalPertandinganModel>> getJadwalPertandinganList() async {
    var jadwalPertandinganMapList = await selectJP();
    int count = jadwalPertandinganMapList.length;
    List<JadwalPertandinganModel> jadwalPertandinganList = List<JadwalPertandinganModel>();
    for (int i=0; i<count; i++) {
      jadwalPertandinganList.add(JadwalPertandinganModel.fromMap(jadwalPertandinganMapList[i]));
    }
    return jadwalPertandinganList;
  }

}