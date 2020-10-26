import 'package:classic_flutter_news/podo/category.dart';
import 'package:classic_flutter_news/providers/home_provider.dart';
import 'package:classic_flutter_news/widgets/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Book extends StatelessWidget {
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
//                getSearchBarUI(context),

                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Buku Terbaru",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.015, 0.015],
                            colors: [
                              Color.fromRGBO(209, 2, 99, 1),
                              Theme.of(context).backgroundColor
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GridView.builder(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          Entry entry = homeProvider.trends.feed.entry[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: SpotLight(
                              img: entry.coverImage,
                              title: entry.title,
                              entry: entry,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
