// To parse this JSON data, do
//
//     final detailChartKoran = detailChartKoranFromJson(jsonString);

import 'dart:convert';

DetailChartKoran detailChartKoranFromJson(String str) =>
    DetailChartKoran.fromJson(json.decode(str));

String detailChartKoranToJson(DetailChartKoran data) =>
    json.encode(data.toJson());

class DetailChartKoran {
  DetailChartKoran({
    this.version,
    this.encoding,
    this.feed,
  });

  String version;
  String encoding;
  List<FeedDetail> feed;

  factory DetailChartKoran.fromJson(Map<String, dynamic> json) =>
      DetailChartKoran(
        version: json["version"],
        encoding: json["encoding"],
        feed: List<FeedDetail>.from(
            json["feed"].map((x) => FeedDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "encoding": encoding,
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
      };
}

class FeedDetail {
  FeedDetail({
    this.id,
    this.namaPembeli,
    this.namaKoran,
    this.buyOn,
    this.hargaKoran,
    this.status,
    this.idorder,
  });

  String id;
  String namaPembeli;
  String namaKoran;
  DateTime buyOn;
  String hargaKoran;
  String status;
  String idorder;

  factory FeedDetail.fromJson(Map<String, dynamic> json) => FeedDetail(
        id: json["id"],
        namaPembeli: json["nama_pembeli"],
        namaKoran: json["nama_koran"],
        buyOn: DateTime.parse(json["buy_on"]),
        hargaKoran: json["harga_koran"],
        status: json["status"],
        idorder: json["idorder"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pembeli": namaPembeli,
        "nama_koran": namaKoran,
        "buy_on":
            "${buyOn.year.toString().padLeft(4, '0')}-${buyOn.month.toString().padLeft(2, '0')}-${buyOn.day.toString().padLeft(2, '0')}",
        "harga_koran": hargaKoran,
        "status": status,
        "idorder": idorder,
      };
}
