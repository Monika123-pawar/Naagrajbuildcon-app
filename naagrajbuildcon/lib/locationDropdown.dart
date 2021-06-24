import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoctaionDropdown extends StatefulWidget {
  @override
  _LoctaionDropdownState createState() => _LoctaionDropdownState();
}

class _LoctaionDropdownState extends State<LoctaionDropdown> {
  String selectedSpinnerItem = 'Panvel';
  List location = List();
  Future myFuture;

  final String uri = 'https://adfest.in/naagrajbuildcon/api/v1/location';

  Future<String> fetchData() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var res = await http
          .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});

      var resBody = json.decode(response.body)['data'];

      setState(() {
        location = resBody;
      });

      print('Loaded Successfully');
      print(location[4]['title']);
      return "Loaded Successfully";
    } else {
      throw Exception('Failed to load data.');
    }
  }

  @override
  void initState() {
    myFuture = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: myFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        items: location.map((data) {
                          return DropdownMenuItem(
                            child: Text(data['title']),
                            value: data['title'],
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            selectedSpinnerItem = newVal;
                          });
                        },
                        value: selectedSpinnerItem,
                      ),
                      Text(
                        'Selected Item = ' + '$selectedSpinnerItem',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ])),
          );
        });
  }
}