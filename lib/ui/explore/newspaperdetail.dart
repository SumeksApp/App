import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_flutter_news/model/user_data.dart';
import 'package:classic_flutter_news/podo/koranaddtochart.dart';
import 'package:classic_flutter_news/ui/explore/keranjangdetail.dart';
import 'package:classic_flutter_news/ui/explore/keranjanglist.dart';
import 'package:classic_flutter_news/ui/explore/newspaper.dart';
import 'package:classic_flutter_news/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/rich_text_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../podo/koran.dart';
import '../../helper/apikoran.dart';
import '../../providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:classic_flutter_news/widgets/Iconbutton.dart';
import '../../ui_user/login.dart';
import '../../helper/sharedPref.dart';
import '../../helper/apikoran.dart';

class Newspaperdetail extends StatefulWidget {
  final Feed feed;

  const Newspaperdetail({Key key, this.feed}) : super(key: key);
  @override
  _NewspaperdetailState createState() => _NewspaperdetailState(this.feed);
}

class _NewspaperdetailState extends State<Newspaperdetail> {
  Feed feed;
  ApiKoran apiKoran = ApiKoran();
  int dropDownValue = 0;

  _NewspaperdetailState(this.feed) {
    loadSharedPrefs();
  }
  SharedPref sharedPref = SharedPref();
  static String isLogin;
  static String _name;
  static String _profile;

  loadSharedPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isLogin = prefs.getString("isLogin") == null
            ? "0"
            : prefs.getString("isLogin");
        _name = prefs.getString("name") == null
            ? "Please LogIn"
            : prefs.getString("name");
        _profile = prefs.getString("profile") == null
            ? null
            : prefs.getString("profile");
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(
              'Hallo $_name, Barang Anda Berhasil Ditambahkan ke Keranjang'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(
                    'Untuk melanjutkan pembayaran, silahkan lihat keranjang Anda !'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future nav(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Keranjang()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: new AppBar(
        //warna background
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        titleSpacing: 0.0,
        //judul
        //          body: new Container(
        //              padding: EdgeInsets.all(20.0),
        //              child: new Image.asset('assets/images/logohome.png')
        //          ),
        title: Container(
            child: Row(
          children: [
            Text(
              "Sumatera Ekspres",
              style: TextStyle(
                fontFamily: 'SouvenirBold',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        )),
        backgroundColor: Colors.blue[900],

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //          new Image.asset('assets/images/logohome.png', width: 250.0,),

              IconButton(
                icon: IconNotification(
                    icon: Icons.shopping_cart,
                    badgeColor: Colors.red,
                    badgeText: "9"),
                iconSize: 37,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  nav(context);
                },
              ),
              IconButton(
                icon: IconNotification(
                    icon: Icons.sms, badgeColor: Colors.red, badgeText: "9"),
                iconSize: 37,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                },
              ),
              IconButton(
                icon: IconNotification(
                    icon: Icons.account_balance_wallet,
                    badgeColor: Colors.red,
                    badgeText: "9"),
                iconSize: 37,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ApiKoran.getDataKoran(),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 300,
                width: 340,
                decoration:
                    BoxDecoration(color: Colors.blueGrey[50], boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[800],
                    blurRadius: 10,
                  )
                ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(10.0)),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(padding: const EdgeInsets.all(10.0)),
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl: feed.koranCoverImage,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/place.png",
                                    fit: BoxFit.cover,
                                    height: 400.0,
                                    width: 300.0,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(padding: const EdgeInsets.all(10.0)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(feed.namaKoran,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SouvenirBold',
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Edisi :  ${feed.publishOn.year}-${feed.publishOn.month}-${feed.publishOn.day}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Page: ${feed.jumlahHalaman}",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Sized : ${feed.sizeKoran}",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Description",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              feed.namaKoran,
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "${feed.publishOn.day} - ${feed.publishOn.month} - ${feed.publishOn.year}",
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(_name)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [Text("Pilih Harga")],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(90, 0, 0, 0)),
                  Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          DropdownButton<int>(
                            value: dropDownValue,
                            onChanged: (int newVal) {
                              setState(() {
                                dropDownValue = newVal;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: 0,
                                child: Text('Rp.0'),
                              ),
                              DropdownMenuItem(
                                value: 25000,
                                child: Text('Rp.25.000/Minggu'),
                              ),
                              DropdownMenuItem(
                                value: 50000,
                                child: Text('Rp.50.000/Bulan'),
                              ),
                              DropdownMenuItem(
                                value: 80000,
                                child: Text('Rp.80.000/Tahun'),
                              ),
                            ],
                          ),
                        ],

                        // child: DropdownButton<int>(
                        //   value: dropdownValue,
                        //   icon: Icon(Icons.arrow_right),
                        //   iconSize: 24,
                        //   elevation: 16,
                        //   style: TextStyle(color: Colors.black),
                        //   onChanged: (int newValue) {
                        //     setState(() {
                        //       dropdownValue = newValue;
                        //     });
                        //   },
                        //   items: <int>[10000, 20000, 40000, 0]
                        //       .map<DropdownMenuItem<int>>((int value) {
                        //     return DropdownMenuItem<int>(
                        //       value: value,
                        //       child: Text('$value'),
                        //     );
                        //   }).toList(),
                        // ),
                        // child: IconButton(
                        //   icon: Icon(Icons.arrow_right),
                        //   onPressed: () {
                        //     Harga();
                        //   },
                        //   iconSize: 40,
                        // )
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 120.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(" Add to Chart"),
                    onPressed: () {
                      _showcontent();
                      ApiKoran.postKoran(
                          "$_name",
                          "${feed.namaKoran}",
                          '$dropDownValue',
                          "berhasil",
                          " ${feed.publishOn.year}${feed.publishOn.month}${feed.publishOn.day}");
                    },
                    color: Color(0xff0091EA),
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    animationDuration: Duration(seconds: 1),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
