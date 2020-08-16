class InfoPemainModel {
  int id;
  String nama_pemain;
  String tinggi_badan;
  String berat_badan;
  String posisi_pemain;
  String nomor_punggung;
  int id_tim;

  // konstruktor versi 1
  InfoPemainModel(this.nama_pemain, this.tinggi_badan, this.berat_badan, this.posisi_pemain,this.nomor_punggung);

  // konstruktor versi 2: konversi dari Map ke Contact
  InfoPemainModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nama_pemain = map['nama_pemain'];
    this.tinggi_badan = map['tinggi_badan'];
    this.berat_badan = map['berat_badan'];
    this.posisi_pemain = map['posisi_pemain'];
    this.nomor_punggung = map['nomor_punggung'];
    this.id_tim=map['id_tim'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get _id => id;
  String get _nama_pemain => nama_pemain;
  String get _tinggi_badan => tinggi_badan;
  String get _berat_badan => berat_badan;
  String get _posisi_pemain => posisi_pemain;
  String get _nomor_punggung => nomor_punggung;
  int get _id_tim => id_tim;

  // setter
  set _nama_pemain(String value) {
    nama_pemain = value;
  }

  set _logo_tinggi_badan(String value) {
    tinggi_badan = value;
  }

  set _berat_badan(String value) {
    berat_badan = value;
  }

  set _posisi_pemain(String value) {
    posisi_pemain = value;
  }

  set _nomor_punggung(String value) {
    nomor_punggung = value;
  }

  set _id_tim(int value) {
    id_tim = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    print("dariiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii info tim model check");
    print(nama_pemain);
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama_pemain'] = nama_pemain;
    map['tinggi_badan'] = tinggi_badan;
    map['berat_badan'] = berat_badan;
    map['posisi_pemain'] = posisi_pemain;
    map['nomor_punggung'] = nomor_punggung;
    map['id_tim']=id_tim;
    return map;
  }

}