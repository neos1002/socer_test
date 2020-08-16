class InfoTimModel {
  int _id;
  String nama_tim;
//  String logo_tim;
  String tahun_berdiri;
  String alamat_markas;
  String kota_markas;

  // konstruktor versi 1
  InfoTimModel(this.nama_tim, this.tahun_berdiri, this.alamat_markas, this.kota_markas);

  // konstruktor versi 2: konversi dari Map ke Contact
  InfoTimModel.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this.nama_tim = map['nama_tim'];
//    this.logo_tim = map['logo_tim'];
    this.tahun_berdiri = map['tahun_berdiri'];
    this.alamat_markas = map['alamat_markas'];
    this.kota_markas = map['kota_markas'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get _nama_tim => nama_tim;
//  String get _logo_tim => logo_tim;
  String get _tahun_berdiri => tahun_berdiri;
  String get _alamat_markas => alamat_markas;
  String get _kota_markas => kota_markas;

  // setter
  set _nama_tim(String value) {
    nama_tim = value;
  }

  set _logo_tim(String value) {
//    logo_tim = value;
  }

  set _tahun_berdiri(String value) {
    tahun_berdiri = value;
  }

  set _alamat_markas(String value) {
    alamat_markas = value;
  }

  set _kota_markas(String value) {
    kota_markas = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    print("dariiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii info tim model check");
    print(nama_tim);
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama_tim'] = nama_tim;
//    map['logo_tim'] = logo_tim;
    map['tahun_berdiri'] = tahun_berdiri;
    map['alamat_markas'] = alamat_markas;
    map['kota_markas'] = kota_markas;
    return map;
  }

}