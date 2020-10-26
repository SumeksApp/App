import 'package:classic_flutter_news/helper/apikoran.dart';
import 'package:classic_flutter_news/providers/home_provider.dart';
import '../../widgets/itemkoran.dart';
import '../../podo/koran.dart';
import 'package:classic_flutter_news/widgets/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'newspaperdetail.dart';

class Newspaper extends StatelessWidget {
  @override
//  _HomeState createState() => _HomeState();
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => ApiKoran.getDataKoran(),
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<Feed>>(
                  future: ApiKoran.getDataKoran(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      List<Feed> listKoran = snapshot.data;

                      return GridView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1),
                        ),
                        itemCount: listKoran.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(5.0),
                            highlightColor: Colors.blue,
                            child: itemBarang(listKoran[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => new Newspaperdetail(
                                          feed: listKoran[index])));
                            },
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
