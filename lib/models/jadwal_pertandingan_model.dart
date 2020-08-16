class JadwalPertandinganModel {
  int _id;
  String _tanggal_pertandingan;
  String _waktu_pertandingan;
  int _id_team_home;
  int _id_team_away;

  JadwalPertandinganModel(this._tanggal_pertandingan, this._waktu_pertandingan,
      this._id_team_home, this._id_team_away);

  JadwalPertandinganModel.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._tanggal_pertandingan = map['tanggal_pertandingan'];
    this._waktu_pertandingan = map['waktu_pertandingan'];
    this._id_team_home = map['id_team_home'];
    this._id_team_away= map['id_team_away'];
  }

  int get id => _id;

  String get tanggal_pertandingan => _tanggal_pertandingan;

  set tanggal_pertandingan(String value) {
    _tanggal_pertandingan = value;
  }

  String get waktu_pertandingan => _waktu_pertandingan;

  set waktu_pertandingan(String value) {
    _waktu_pertandingan = value;
  }

  int get id_team_home => _id_team_home;

  set id_team_home(int value) {
    _id_team_home = value;
  }

  int get id_team_away => _id_team_away;

  set id_team_away(int value) {
    _id_team_away = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['tanggal_pertandingan'] = tanggal_pertandingan;
    map['waktu_pertandingan'] = waktu_pertandingan;
    map['id_team_home'] = id_team_home;
    map['id_team_away'] = id_team_away;
    return map;
  }

}