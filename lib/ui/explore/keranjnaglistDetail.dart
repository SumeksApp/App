import 'package:classic_flutter_news/helper/apikoran.dart';
import 'package:classic_flutter_news/podo/korandetailchart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class KeranjangListDetail extends StatefulWidget {
  final FeedDetail feed;

  const KeranjangListDetail({Key key, this.feed}) : super(key: key);
  @override
  _KeranjangListDetailState createState() => _KeranjangListDetailState(feed);
}

enum SingingCharacter { lafayette, jefferson }

class _KeranjangListDetailState extends State<KeranjangListDetail> {
  SingingCharacter _character = SingingCharacter.lafayette;
  int dropDownValue = 0;
  FeedDetail feed;

  _KeranjangListDetailState(this.feed);
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Transaksai anda telah berhasil dilakukan'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Silahkan lakukan konfirmasi pembayaran !'),
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

  Future _launchURL() async {
    const url = 'https://wa.me/6282176350289';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        titleSpacing: 0.0,
        //warna background

        //judul
//          body: new Container(
//              padding: EdgeInsets.all(20.0),
//              child: new Image.asset('assets/images/logohome.png')
//          ),
        title: Text(
          "   Sumatera Ekspres",
          style: TextStyle(
            fontFamily: 'SouvenirBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[900],

        actions: <Widget>[
//          new Image.asset('assets/images/logohome.png', width: 250.0,),
          IconButton(
            icon: Icon(Icons.sms, color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Langganan E-Paper",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Rp. ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text("${feed.hargaKoran}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 400,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Metode Pembayaran",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     DropdownButton<int>(
                    //       value: dropDownValue,
                    //       onChanged: (int newVal) {
                    //         setState(() {
                    //           dropDownValue = newVal;
                    //         });
                    //       },
                    //       items: [
                    //         DropdownMenuItem(
                    //           value: 0,
                    //           child: Text('Pilih'),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: 25000,
                    //           child: Row(
                    //             children: [
                    //               Text('BCA'),
                    //             ],
                    //           ),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: 50000,
                    //           child: Row(
                    //             children: [
                    //               Text('BNI'),
                    //             ],
                    //           ),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: 80000,
                    //           child: Row(
                    //             children: [
                    //               Text('BRI'),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  RadioListTile<SingingCharacter>(
                    title: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bank Negara Indonesia'),
                            Text('08475456623467')
                          ],
                        ),
                      ],
                    ),
                    value: SingingCharacter.lafayette,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<SingingCharacter>(
                    title: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bank Rakyat Indonesia'),
                            Text('54637634348780')
                          ],
                        ),
                      ],
                    ),
                    value: SingingCharacter.jefferson,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 380,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text("nomor order"),
                        SizedBox(
                          width: 160,
                        ),
                        Text("${feed.idorder}")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text("user"),
                        SizedBox(
                          width: 175,
                        ),
                        Text("${feed.namaPembeli}")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text("Nama Koran"),
                        SizedBox(
                          width: 119,
                        ),
                        Text("${feed.namaKoran}")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 340,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text("Silahkan Lakukan Screenshot, seblum mengklik"),
                      ],
                    ),
                    Text("tombol bayar")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 280.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(" Bayar "),
                      onPressed: () {
                        _showcontent();
                        ApiKoran.postBayar(
                            "${feed.namaPembeli}",
                            "${feed.namaKoran}",
                            "${feed.hargaKoran}",
                            "${feed.idorder}",
                            "berhasil");
                        ApiKoran.deleteChart("${feed.id}");
                      },
                      color: Color(0xff0091EA),
                      textColor: Colors.white,
                      splashColor: Colors.blueGrey,
                      animationDuration: Duration(seconds: 1),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(9.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 280,
                  height: 50,
                  child: RaisedButton(
                    child: Text("Konfirmasi"),
                    onPressed: () async {
                      _launchURL();
                    },
                    color: Color(0xff0091EA),
                    textColor: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
