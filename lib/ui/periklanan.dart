import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../podo/category.dart';
import '../providers/home_provider.dart';
import '../helper/constants.dart';
import '../helper/api.dart';
import '../ui/genre.dart';

import '../widgets/book_list_item.dart';
import '../widgets/book_card.dart';
import '../widgets/spotlight.dart';

class Periklanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        return Scaffold(
          body: homeProvider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => homeProvider.getFeeds(),
                  child: ListView(
                    children: <Widget>[
                      Container(
//                child: new ListView(
//                  physics: ClampingScrollPhysics(),
//                  children: <Widget>[
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0),
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              _menuatas(),
                              //_buildGojekServicesMenu(),
                            ],
                          )),
//                  ],
//                ),

//              getSearchBarUI(context),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rekomendasi Baru",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeProvider.recent.feed.entry.length,
                        itemBuilder: (BuildContext context, int index) {
                          Entry entry = homeProvider.recent.feed.entry[index];

                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: BookListItem(
                              img: entry.coverImage,
                              title: entry.title,
                              author: entry.category[0],
                              desc: entry.summary
                                  .replaceAll(RegExp(r"<[^>]*>"), ''),
                              entry: entry,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

          //backgroundColor: GojekPalette.grey,
//        body: new Container(
//          child: new ListView(
//            physics: ClampingScrollPhysics(),
//            children: <Widget>[
//              new Container(
//                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//                  color: Colors.white,
//                  child: new Column(
//                    children: <Widget>[
//                      _buildGopayMenu(),
//                      //_buildGojekServicesMenu(),
//                    ],
//                  )),
//            ],
//          ),
//        ),
        );
      },
    );
  }
}

Widget _menuatas() {
  return new Container(
      height: 120.0,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "Temukan Bisnis, Job Fair, Society & ADV Dan Iklan Baris",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontFamily: "NeoSansBold"),
                ),
//                Text(
//                  'Temukan Bisnis, Job Fair, Society & ADV Dan Iklan Baris',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 13.0
//                  ),
//                ),
//                new Container(
//                  child: new Text(
//                    "Rp. 120.000",
//                    style: new TextStyle(
//                        fontSize: 14.0,
//                        color: Colors.white,
//                        fontFamily: "NeoSansBold"),
//                  ),
//                )
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "assets/icons/icon_transfer.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "BISNIS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "NeoSansBold"),
                    )
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "assets/icons/icon_scan.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "JOB FAIR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "NeoSansBold"),
                    )
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "assets/icons/icon_saldo.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "SOCIETY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "NeoSansBold"),
                    )
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "assets/icons/icon_menu.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "IKLAN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "NeoSansBold"),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ));
}
//Widget _buildGojekServicesMenu() {
//  return new SizedBox(
//      width: double.infinity,
//      height: 220.0,
//      child: new Container(
//          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
//          child: GridView.builder(
//              physics: ClampingScrollPhysics(),
//              itemCount: 8,
//              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 4),
//              itemBuilder: (context, position) {
//                return new Text("Gojek Menu");
//              })));
//}
