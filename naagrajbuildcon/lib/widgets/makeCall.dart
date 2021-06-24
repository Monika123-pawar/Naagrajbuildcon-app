import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search.dart';

class MakeCall extends StatelessWidget {
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
