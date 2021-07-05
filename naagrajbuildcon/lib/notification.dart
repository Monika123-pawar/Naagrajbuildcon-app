import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:naagrajbuildcon/search.dart';

class NotificationPage extends StatefulWidget {
  final String tokens;
  const NotificationPage(this.tokens);
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  ScrollController _scrollController;
  bool _isOnTop = true;

  List data;
  var dataId;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/notifications?access_token=doJTMpvz6ycLamN7Wn7gfFtnffUe7E"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body)['data'];
    print(data);
    // this.setState(() {
    //   data = json.decode(response.body)['data'];
    //   print(data);
    // });
    return "Something went wrong. Please check again";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    // setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              // Navigator.pop(context),.then((value) => setState(() {}))
              Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Search()
            ),
    ),

        ),
        title:Text("Notification", style:TextStyle(fontSize: 20.0)),
      ),
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical,//.horizontal
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: new   Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:data!=null? ListTile(
                title:Text(data[0]["title"]) ,
                // subtitle: Text("Id:${data[index]["id"]}"),
                leading: Icon(Icons.call_to_action),
                onTap: (){
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context)=>())
                  //     );
                },
              ):Center(child: Text('Your notification box is empty',style:TextStyle(color: Colors.black,fontSize: 25),)),
            ),
          ),
        ),
      ),


       );
  }
}
