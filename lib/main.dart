import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main () => runApp(new FlutterApp2());

class FlutterApp2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FlutterApp2State();
  }
}

class FlutterApp2State extends State<FlutterApp2>{

  var _isLoading = true;

  _fetchData() async {
    final url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    var response = await http.get(url);
    // print(response);

    if(response.statusCode == 200){
      print(response.body);
      final data = json.decode(response.body);
      final videosJson = data["videos"];
      videosJson.forEach( (video){
        print(video["name"]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("App_2"),
          actions: <Widget>[
            new IconButton(icon:new Icon(Icons.refresh),
            onPressed:  (){
              print ('Clicked');
              _fetchData();
            },),
          ],
        ),
        body: Center(
          child: _isLoading? new CircularProgressIndicator() :Text('Hellp'),
        ),
      ),
    );
  }
}