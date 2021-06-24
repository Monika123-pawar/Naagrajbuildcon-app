import 'package:flutter/material.dart';
import 'package:naagrajbuildcon/search.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Search()),
              ),),
      ),
      body: Container(
        child: Text("Cooming soon Message Page"),
      ),
    );
  }
}
