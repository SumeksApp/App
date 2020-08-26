
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


class Update extends StatelessWidget {
  @override
//  _HomeState createState() => _HomeState();
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        return Scaffold(

//          body: Column(
//            children:  <Widget>[
//            Container(
//              height: 90.0,
//                color: Colors.lightBlueAccent,
//            )
//            ]
//          )

          body: homeProvider.loading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : RefreshIndicator(
            onRefresh: () => homeProvider.getFeeds(),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                getSearchBarUI(context),

                Container(
                  height: 250,
                  child: Center(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.top.feed.entry.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Entry entry = homeProvider.top.feed.entry[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: BookCard(
                            img: entry.coverImage,
                            entry: entry,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.015, 0.015],
                      colors: [
                        Color.fromRGBO(209, 2, 99, 1),
                        Theme.of(context).backgroundColor
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Kategori",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.top.feed.link.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Link link = homeProvider.top.feed.link[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Genre(
                                      title: "${link.title}",
                                      url: link.href,
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "${link.title}",
                                    style: TextStyle(
                                      color:
                                      Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.015, 0.015],
                      colors: [
                        Color.fromRGBO(209, 2, 99, 1),
                        Theme.of(context).backgroundColor
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Berita Terbaru",
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
        );
      },
    );
  }

  Widget getSearchBarUI(BuildContext context) {
    // Create a text controller and use it to retrieve the current value
    // of the TextField.
    final _txtSearch = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 3, bottom: 3),
                  child: TextField(
                    controller: _txtSearch,
                    onChanged: (String txt) {},
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cari Berita...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _txtSearch.text.isEmpty
                      ? Fluttertoast.showToast(
                    msg:
                    "You just perform an empty search so we had nothing to show you.",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 5,
                  )
                      : Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Genre(
                        title: "Search Result",
                        url: Api.searchUrl + _txtSearch.text,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.search,
                      size: 25, color: Theme.of(context).backgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//
//  //create controller untuk tabBar
//  TabController controller;
//
//  @override
//
//  void initState(){
//    controller = new TabController(vsync: this, length: 1);
//    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
//    super.initState();
//  }
//
//  @override
//  void dispose(){
//    controller.dispose();
//    super.dispose();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      //create appBar
//      appBar: new AppBar(
//        //warna background
//        backgroundColor: Colors.lightGreen,
//        //judul
//        title: new Text("Tampilan Home "),
//        //bottom
//        bottom: new TabBar(
//          controller: controller,
//          //source code lanjutan
//          tabs: <Widget>[
//            new Tab(icon: new Icon(Icons.email),text: "Udapte",),
////            new Tab(icon: new Icon(Icons.queue_music),text: "Cerita",),
//          ],
//        ),
//      ),
//
//      //source code lanjutan
//      //buat body untuk tab viewnya
//      body: new TabBarView(
//        //controller untuk tab bar
//        controller: controller,
//        children: <Widget>[
//          //kemudian panggil halaman sesuai tab yang sudah dibuat
//          new cerita.Cerita(),
//          //new music.Music(),
//        ],
//      ),
//    );
//  }
//}