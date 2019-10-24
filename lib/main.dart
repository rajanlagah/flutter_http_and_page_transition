import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './views/video_cell.dart';

void main() => runApp(new FlutterApp2());

class FlutterApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FlutterApp2State();
  }
}

class FlutterApp2State extends State<FlutterApp2> {
  var _isLoading = false;
  var videos = [];

  _fetchData() async {
    final url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    var response = await http.get(url);
    // print(response);
    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      final videosJson = data["videos"];
      setState(() {
        this.videos = videosJson;
        _isLoading = false;
      });
      videosJson.forEach((video) {
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
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print('Clicked');
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            ),
          ],
        ),
        body: Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.videos.length,
                  itemBuilder: (context, i) {
                    final video = this.videos[i];
                    return new FlatButton(
                      padding: new EdgeInsets.all(0),
                      child: new VideoCell(video),
                      onPressed: () {
                        Navigator.push(context, 
                        new MaterialPageRoute(
                          builder: (context) => new DetailPage(),
                        ),
                       );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Details"),
      ),
      body: new Center(
        child: new Text("Details of pages"),
      ),
    );
  }
}
