import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Future fetchData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/property?popular=1"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      if(response.body.isNotEmpty) {
        var data = json.decode(response.body)['data'];
        print(data);
      }

    });
    return "Success!";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tiitle'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                  //Center(child:Text(snapshot.data.items[0].id) ,);
                  ListView.builder(
                    itemCount: snapshot.data.items.length,
                    itemBuilder: (context, int i) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(snapshot.data.totalItems.toString()),
                            ),
                            title: Text(snapshot.data.items[i].id),
                            subtitle: Text(snapshot.data.items[i].kind),
                          ),
                          Divider(
                            color: Colors.grey,
                          )
                        ],
                      );
                    },
                  );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }}