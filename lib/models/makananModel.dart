class MakananModel {
  final int id;
  final String nama, gambar;
  final List<dynamic> bahan, bumbu;

  MakananModel({this.id, this.bahan, this.bumbu, this.gambar, this.nama});

  MakananModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      nama = json["nama"],
      gambar = json["gambar"],
      bahan = json["bahan"],
      bumbu = json["bumbu"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "gambar": gambar,
    "bahan": bahan,
    "bumbu": bumbu
  };
}
