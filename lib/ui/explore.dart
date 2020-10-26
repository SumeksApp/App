import 'package:cached_network_image/cached_network_image.dart';
import 'package:classic_flutter_news/main.dart';
import 'package:classic_flutter_news/widgets/Iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../podo/category.dart';
import '../providers/home_provider.dart';
import '../ui/genre.dart';
import './explore/book.dart' as book;
import './explore/magazine.dart' as magazine;
import './explore/newspaper.dart' as newspaper;

class Explore extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<Explore> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
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
      appBar: AppBar(
        bottom: TabBar(
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Tab>[
              new Tab(text: "Koran"),
              new Tab(text: "Majalah"),
              new Tab(text: "Buku"),
            ]),
        title: Container(
          child: Row(
            children: [
              Text(
                "   E-Paper",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //          new Image.asset('assets/images/logohome.png', width: 250.0,),
              IconNotification(
                  icon: Icons.sms, badgeColor: Colors.blue, badgeText: "9"),
              IconNotification(
                  icon: Icons.notifications,
                  badgeColor: Colors.red,
                  badgeText: "5"),
              IconNotification(
                  icon: Icons.account_balance_wallet,
                  badgeColor: Colors.red,
                  badgeText: "2"),
            ],
          ),
        ],
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new newspaper.Newspaper(),
          new magazine.Magazine(),
          new book.Book(),
        ],
      ),
    );
  }
}

// class Explore extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(
//       builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
//         return Scaffold(
//           body: DefaultTabController(
//             length: 3,
//             child: Scaffold(
//               appBar: AppBar(
//                 bottom: TabBar(
//                   labelColor: Colors.redAccent,
//                   unselectedLabelColor: Colors.white,
//                   indicatorSize: TabBarIndicatorSize.label,
//                   tabs: [
//                     Tab(text: "NEWSPAPER"),
//                     Tab(text: "BOOK"),
//                     Tab(text: "MAGAZINE"),
//                   ],
//                 ),
//                 title: Text(
//                   "   E-Paper",
//                   style: TextStyle(
//                     fontFamily: 'SouvenirBold',
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 backgroundColor: Colors.blue[900],
//                 actions: <Widget>[
// //          new Image.asset('assets/images/logohome.png', width: 250.0,),
//                   IconButton(
//                     icon: Icon(Icons.sms, color: Colors.white),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.notifications, color: Colors.white),
//                   ),
//                   IconButton(
//                     icon:
//                         Icon(Icons.account_balance_wallet, color: Colors.white),
//                   ),
//                 ],
//               ),
//               body: Container(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
