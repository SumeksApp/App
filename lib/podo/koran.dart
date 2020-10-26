// To parse this JSON data, do
//
//     final dataKoran = dataKoranFromJson(jsonString);

import 'dart:convert';
import 'package:jiffy/jiffy.dart';

DataKoran dataKoranFromJson(String str) => DataKoran.fromJson(json.decode(str));

String dataKoranToJson(DataKoran data) => json.encode(data.toJson());

class DataKoran {
  DataKoran({
    this.version,
    this.encoding,
    this.feed,
  });

  String version;
  String encoding;
  List<Feed> feed;

  factory DataKoran.fromJson(Map<String, dynamic> json) => DataKoran(
        version: json["version"],
        encoding: json["encoding"],
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "encoding": encoding,
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
      };
}

class Feed {
  var length;

  Feed({
    this.id,
    this.namaKoran,
    this.jumlahHalaman,
    this.publishOn,
    this.sizeKoran,
    this.koranCoverImage,
  });

  String id;
  String namaKoran;
  String jumlahHalaman;
  DateTime publishOn;
  String sizeKoran;
  String koranCoverImage;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        namaKoran: json["nama_koran"],
        jumlahHalaman: json["jumlah_halaman"],
        publishOn: DateTime.tryParse(json["publish_on"]),
        sizeKoran: json["size_koran"],
        koranCoverImage: json["koran_cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_koran": namaKoran,
        "jumlah_halaman": jumlahHalaman,
        "publish_on":
            "${publishOn.year.toString().padLeft(4, '0')}-${publishOn.month.toString().padLeft(2, '0')}-${publishOn.day.toString().padLeft(2, '0')}",
        "size_koran": sizeKoran,
        "koran_cover_image": koranCoverImage,
      };
}
