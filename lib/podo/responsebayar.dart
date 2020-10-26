// To parse this JSON data, do
//
//     final responseBayar = responseBayarFromJson(jsonString);

import 'dart:convert';

ResponseBayar responseBayarFromJson(String str) =>
    ResponseBayar.fromJson(json.decode(str));

String responseBayarToJson(ResponseBayar data) => json.encode(data.toJson());

class ResponseBayar {
  ResponseBayar({
    this.namaPembeli,
    this.namaKoran,
    this.hargaKoran,
    this.status,
  });

  String namaPembeli;
  String namaKoran;
  String hargaKoran;
  String status;

  factory ResponseBayar.fromJson(Map<String, dynamic> json) => ResponseBayar(
        namaPembeli: json["nama_pembeli"],
        namaKoran: json["nama_koran"],
        hargaKoran: json["harga_koran"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "nama_pembeli": namaPembeli,
        "nama_koran": namaKoran,
        "harga_koran": hargaKoran,
        "status": status,
      };
}
