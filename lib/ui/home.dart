import '../ui/update.dart' as update;
import '../ui//cerita.dart' as cerita;
import '../ui/periklanan.dart' as periklanan;
import '../ui/hiburan.dart' as hiburan;
import '../ui/settings.dart' as setting;
import 'package:flutter/material.dart';
//import 'package:firebase_admob/firebase_admob.dart';

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
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
            fontSize: 20,
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

        //bottom
//        bottom: new TabBar(
////          controller: controller,
////          //source code lanjutan
////          tabs: <Widget>[
////
////            new Tab(text: "Berita"),
////            new Tab(text: "Cerita"),
////            new Tab(text: "Iklan"),
////            new Tab(text: "Hiburan"),
//////            new Tab(icon: new Icon(Icons.queue_music),text: "Cerita",),
////          ],
////        ),
////      ),
        bottom: TabBar(
            controller: controller,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "BERITA",
                      ),
                    )),
              ),
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "CERITA",
                      ),
                    )),
              ),
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "IKLAN",
                      ),
                    )),
              ),
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "HIBURAN",
                      ),
                    )),
              ),
            ]),
      ),

//    )

      //source code lanjutan
      //buat body untuk tab viewnya
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new update.Update(),
          new cerita.Cerita(),
          new periklanan.Periklanan(),
          new hiburan.Hiburan(),

          //new music.Music(),
        ],
      ),
    );
  }
}
