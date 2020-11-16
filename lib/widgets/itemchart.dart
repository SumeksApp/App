import 'package:classic_flutter_news/podo/korandetailchart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemchart(FeedDetail detail) {
  return ListView(
    children: <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
                child: Container(
              width: 500,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.grey[250],
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(10.0)),
                            Container(
                              width: 80,
                              child: Image.asset('images/Sumeks.png'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  Padding(padding: const EdgeInsets.all(10.0)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Sumatera Ekpess",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SouvenirBold',
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Koran Harian Sumatera Ekspress",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Rp. 32. 000 / Bulan",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      )),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            size: 18,
                                          ),
                                          onPressed: null),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      )),
                                      child: IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: null),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.delete_outline),
                                  onPressed: null)
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            )),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[250],
                  border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "TOTAL PEMBAYARAN",
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Rp. 32.000",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Biaya belum termasuk ongkir",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Bayar",
                            style: TextStyle(color: Colors.white),
                          ),
                          alignment: Alignment.center,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
            ),
            Center(
                child: Container(
              width: 500,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.grey[250],
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(10.0)),
                            Container(
                              width: 80,
                              child: Image.asset('images/Sumeks.png'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  Padding(padding: const EdgeInsets.all(10.0)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Sumatera Ekpess",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SouvenirBold',
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Koran Harian Sumatera Ekspress",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Rp. 32. 000 / Bulan",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      )),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            size: 18,
                                          ),
                                          onPressed: null),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      )),
                                      child: IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: null),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.delete_outline),
                                  onPressed: null)
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            )),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[250],
                  border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "TOTAL PEMBAYARAN",
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  detail.hargaKoran,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Biaya belum termasuk ongkir",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Bayar",
                            style: TextStyle(color: Colors.white),
                          ),
                          alignment: Alignment.center,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
