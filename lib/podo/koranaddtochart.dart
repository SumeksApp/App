// To parse this JSON data, do
//
//     final dataKoran = dataKoranFromJson(jsonString);

import 'dart:convert';

BeliKoran dataKoranFromJson(String str) => BeliKoran.fromJson(json.decode(str));

String dataKoranToJson(BeliKoran data) => json.encode(data.toJson());

class BeliKoran {
  BeliKoran({
    this.namaKoran,
    this.hargaKoran,
    this.status,
  });

  String namaKoran;
  String hargaKoran;
  String status;

  factory BeliKoran.fromJson(Map<String, dynamic> json) => BeliKoran(
        namaKoran: json["nama_koran"],
        hargaKoran: json["harga_koran"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "nama_koran": namaKoran,
        "harga_koran": hargaKoran,
        "status": status,
      };
}
