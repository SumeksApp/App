import 'dart:io';

import 'package:classic_flutter_news/ui/explore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_alert_dialog.dart';
import '../helper/Constants.dart';
import '../providers/favorites_provider.dart';
import 'explore.dart';
import 'iklanbaris.dart';
import 'hasilkan.dart';
import 'iklanbisnis.dart';
import 'upload.dart';
import 'home.dart';
import 'explore.dart';
import 'favorites.dart';
import 'settings.dart';
import 'cerita.dart';

class MainActivity extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainActivity> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            Home(),
            Explore(),
            Upload(),
            Iklanbisnis(),
            //Favorites(),
            Profile(),
            //Settings(),

            ///hasilkan(),
            //Favorites(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.grey[500],
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                //Icons.insert_drive_file,
              ),
              title: Text(
                "E-Paper",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
              ),
              title: Text(
                "Upload",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                //Icons.settings,
                Icons.card_giftcard,
              ),
              title: Text(
                "Hasilkan",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                //Icons.settings,
                Icons.account_balance_wallet,
              ),
              title: Text(
                "Akun Saya",
                style: TextStyle(
                  fontFamily: 'SouvenirBold',
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  exitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                Constants.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Do you really want to quit?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 130,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => exit(0),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 130,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void navigationTapped(int page) {
    if (page == 2.0) {
      Provider.of<FavoritesProvider>(context, listen: false).getFeed();
      _pageController.jumpToPage(page);
    } else {
      _pageController.jumpToPage(page);
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
