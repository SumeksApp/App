import 'package:flutter/material.dart';



class Upload extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Container(
      child: new Center(
        child: Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Icon(Icons.add_box,size: 90.0,color: Colors.lightBlueAccent,),
            new Text("UPLOAD", style: new TextStyle(fontSize: 30.0, color: Colors.lightGreen),)
          ],
        ),
      ),
    );
  }
}