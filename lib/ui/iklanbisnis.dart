import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Iklanbisnis extends StatefulWidget {
  @override
  _IklanbisnisState createState() => _IklanbisnisState();
}

class _IklanbisnisState extends State<Iklanbisnis> {

//  TextEditingController  cuid=new TextEditingController();
  TextEditingController  cjudul=new TextEditingController();
  TextEditingController  cdekripsi=new TextEditingController();
//  TextEditingController  cmobile=new TextEditingController();
//  TextEditingController  cpassword=new TextEditingController();

  void addData(){

    var url="http://pppkpusri.com/classic_news/tambahiklanbisnis.php";
    http.post(url,body: {
      //"uid":cuid.text,
      "judul":cjudul.text,
      "dekripsi":cdekripsi.text,
      //"email":cemail.text,
      //"password":cpassword.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Pasang Iklan Anda"),
        ),
        body: Padding(
          //padding:const EdgeInsets.all(1.0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child:ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
//                  new TextField(
//                    controller: cuid,
//                    decoration: new InputDecoration(
//                      hintText: "UID",
//                      labelText: "UID",
//                    ),
//                  ),

                  new TextField(
                    controller: cjudul,
                    decoration: new InputDecoration(
                      hintText: "Judul",
                      labelText: "Judul",
                    ),
                  ),
                  new TextField(
                    controller: cdekripsi,
                    decoration: new InputDecoration(
                      hintText: "Dekripsi",
                      labelText: "Dekripsi",
                    ),
                  ),
                  new TextField(
                    controller: cdekripsi,
                    decoration: new InputDecoration(
                      hintText: "Dekripsi",
                      labelText: "Dekripsi",
                    ),
                  ),
                  new TextField(
                    controller: cdekripsi,
                    decoration: new InputDecoration(
                      hintText: "Dekripsi",
                      labelText: "Dekripsi",
                    ),
                  ),
//                  new TextField(
//                    controller: cmobile,
//                    decoration: new InputDecoration(
//                      hintText: "Mobile",
//                      labelText: "Mobile",
//                    ),
//                  ),
//                  new TextField(
//                    controller: cpassword,
//                    decoration: new InputDecoration(
//                      hintText: "Password",
//                      labelText: "Password",
//                    ),
//                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new RaisedButton(onPressed: (){
                    addData();
                    Navigator.of(context).pop();
                  },
                    child: new Text("Pasang"),
                    color: Colors.deepOrange,
                  )

                ],
              ),
            ],
          ),
        )
    );
  }
}
