import 'dart:convert';
import 'dart:io';
import 'package:classic_flutter_news/helper/sharedPref.dart';
import 'package:classic_flutter_news/podo/koranaddtochart.dart';
import 'package:classic_flutter_news/podo/korandetailchart.dart';
import 'package:classic_flutter_news/podo/responsebayar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../podo/koran.dart';

class ApiKoran {
  SharedPref sharedPref = SharedPref();
  static String isLogin;
  static String _name;

  static final String _url = 'http://pppkpusri.com/classic_news/apikoran';

  static Future<List<Feed>> getDataKoran() async {
    List<Feed> listKoran = [];
    final response = await http.get('$_url/getdatakoran.php?get=koran');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      DataKoran respFeed = DataKoran.fromJson(json);

      respFeed.feed.forEach((item) {
        listKoran.add(item);
      });
      return listKoran;
    } else {
      return [];
    }
  }

  static Future<BeliKoran> postKoran(String namaPembeli, String namaKoran,
      String hargaKoran, String status, String idorder) async {
    final post = await http.post('$_url/postdatakoran.php', body: {
      'nama_pembeli': namaPembeli,
      'nama_koran': namaKoran,
      'harga_koran': hargaKoran,
      'status': status,
      'idorder': idorder
    });
    if (post.statusCode == 200) {
      BeliKoran beliKoran = BeliKoran.fromJson(jsonDecode(post.body));
      return beliKoran;
    } else {
      return null;
    }
  }

  static Future<ResponseBayar> postBayar(String namaPembeli, String namaKoran,
      String hargaKoran, String idorder, String status) async {
    final post = await http.post('$_url/postbayar.php', body: {
      'nama_pembeli': namaPembeli,
      'nama_koran': namaKoran,
      'harga_koran': hargaKoran,
      'idorder': idorder,
      'status': status
    });
    if (post.statusCode == 200) {
      ResponseBayar bayar = ResponseBayar.fromJson(jsonDecode(post.body));
      return bayar;
    } else {
      return null;
    }
  }

  static Future<ResponseBayar> deleteChart(String id) async {
    final http.Response response = await http.delete(
      '$_url/deletekoran.php?id=$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise
      // `snapshot.hasData` will always return false
      // on `FutureBuilder`.
      return ResponseBayar.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }

  static Future<List<FeedDetail>> getdetailchart(String name) async {
    // try {
    //   var jsonResponse =
    //       await http.get('$_url/getdatabyname.php?pembeli=' + name);
    //   if (jsonResponse.statusCode == 200) {
    //     final jsonItems =
    //         json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
    //     listdetail = jsonItems.map<FeedDetail>((json) {
    //       return FeedDetail.fromJson(json);
    //     }).toList();
    //   }
    // } catch (e) {
    //   return listdetail;
    // }
    List<FeedDetail> listdetailKoran = [];
    final response = await http.get('$_url/getdatabyname.php?pembeli=' + name);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      DetailChartKoran respFeed = DetailChartKoran.fromJson(json);

      respFeed.feed.forEach((item) {
        listdetailKoran.add(item);
      });
      return listdetailKoran;
    } else {
      return [];
    }
  }
}
