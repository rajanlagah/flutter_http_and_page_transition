
import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.all(16),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.network(video["imageUrl"]),
            new Container(height: 10),
            new Text(
              video["name"],
              style: new TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Divider(),
          ]),
    );
  }
}