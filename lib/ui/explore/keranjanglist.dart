// import 'package:classic_flutter_news/helper/apikoran.dart';
// import 'package:classic_flutter_news/helper/sharedPref.dart';
// import 'package:classic_flutter_news/podo/korandetailchart.dart';
// import 'package:classic_flutter_news/ui/explore/keranjnaglistDetail.dart';
// import 'package:classic_flutter_news/widgets/itemchart.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class Keranjang extends StatefulWidget {
//   final FeedDetail detail;

//   const Keranjang({Key key, this.detail}) : super(key: key);
//   @override
//   _KeranjangState createState() => _KeranjangState();
// }

// class _KeranjangState extends State<Keranjang> {
//   List<FeedDetail> detail = List<FeedDetail>();

//   _KeranjangState() {
//     loadSharedPrefs();
//   }
//   SharedPref sharedPref = SharedPref();
//   static String isLogin;
//   static String _name;
//   static String _profile;

//   loadSharedPrefs() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       setState(() {
//         isLogin = prefs.getString("isLogin") == null
//             ? "0"
//             : prefs.getString("isLogin");
//         _name = prefs.getString("name") == null
//             ? "Please LogIn"
//             : prefs.getString("name");
//         _profile = prefs.getString("profile") == null
//             ? null
//             : prefs.getString("profile");
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // ignore: missing_return
//   Future<Null> refresh() async {
//     ApiKoran.getdetailchart(_name).then((item) {
//       setState(() {
//         detail.addAll(item);
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[50],
//       appBar: new AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         centerTitle: false,
//         titleSpacing: 0.0,
//         //warna background

//         //judul
// //          body: new Container(
// //              padding: EdgeInsets.all(20.0),
// //              child: new Image.asset('assets/images/logohome.png')
// //          ),
//         title: Text(
//           "   Sumatera Ekspres",
//           style: TextStyle(
//             fontFamily: 'SouvenirBold',
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.blue[900],

//         actions: <Widget>[
// //          new Image.asset('assets/images/logohome.png', width: 250.0,),
//           IconButton(
//             icon: Icon(Icons.sms, color: Colors.white),
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//           ),
//           IconButton(
//             icon: Icon(Icons.account_balance_wallet, color: Colors.white),
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return Column(
//               children: <Widget>[
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(
//                         width: 20,
//                         height: 20,
//                       ),
//                       Center(
//                           child: Container(
//                         width: 500,
//                         height: 190,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[250],
//                           border: Border.all(
//                             color: Colors.black38,
//                             width: 1,
//                           ),
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Expanded(
//                                   flex: 3,
//                                   child: Column(
//                                     children: <Widget>[
//                                       Padding(
//                                           padding: const EdgeInsets.all(10.0)),
//                                       Container(
//                                         width: 80,
//                                         child: Image.asset(
//                                             'assets/images/Sumeks.png'),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 5,
//                                   child: Container(
//                                     child: Column(
//                                       children: <Widget>[
//                                         Column(
//                                           children: [
//                                             Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(10.0)),
//                                             Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Sumatera Ekpess",
//                                                   style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontFamily: 'SouvenirBold',
//                                                     fontWeight: FontWeight.bold,
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             detail[index].namaKoran,
//                                             style: TextStyle(fontSize: 13),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 2,
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "Rp. ${detail[index].hargaKoran}",
//                                             style: TextStyle(fontSize: 13),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 25,
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 Expanded(
//                                     flex: 4,
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(left: 20),
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 width: 40,
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                   color: Colors.black38,
//                                                   width: 1,
//                                                 )),
//                                                 child: IconButton(
//                                                     icon: Icon(
//                                                       Icons.remove,
//                                                       size: 18,
//                                                     ),
//                                                     onPressed: null),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "1",
//                                                 style: TextStyle(fontSize: 25),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Container(
//                                                 width: 40,
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                   color: Colors.black38,
//                                                   width: 1,
//                                                 )),
//                                                 child: IconButton(
//                                                     icon: Icon(Icons.add),
//                                                     onPressed: null),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     )),
//                                 Expanded(
//                                     flex: 1,
//                                     child: Column(
//                                       children: <Widget>[
//                                         IconButton(
//                                             icon: Icon(Icons.delete_outline),
//                                             onPressed: null)
//                                       ],
//                                     ))
//                               ],
//                             ),
//                           ],
//                         ),
//                       )),
//                       Center(
//                         child: Container(
//                           padding: EdgeInsets.all(20),
//                           width: 500,
//                           height: 120,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[250],
//                             border: Border.all(
//                               color: Colors.black38,
//                               width: 1,
//                             ),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 flex: 10,
//                                 child: Padding(
//                                     padding: EdgeInsets.only(left: 0),
//                                     child: Column(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "TOTAL PEMBAYARAN",
//                                             style: TextStyle(
//                                                 color: Colors.black45),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 4,
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "Rp. ${detail[index].hargaKoran}",
//                                             style:
//                                                 TextStyle(color: Colors.black),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 4,
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "Biaya belum termasuk ongkir",
//                                             style:
//                                                 TextStyle(color: Colors.black),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                               Expanded(
//                                   flex: 3,
//                                   child: Container(
//                                     height: 40,
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue,
//                                       border: Border.all(
//                                         color: Colors.white,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     child: Text(
//                                       "Bayar",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     alignment: Alignment.center,
//                                   ))
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//           itemCount: detail.length,
//         ),
//       ),
//     );
//   }
// }
