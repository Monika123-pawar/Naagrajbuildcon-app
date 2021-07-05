import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data.dart';
import 'detail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResidentialProperties extends StatefulWidget {
  @override
  _ResidentialPropertiesState createState() => _ResidentialPropertiesState();
}

class _ResidentialPropertiesState extends State<ResidentialProperties> {
  List data;
  var propertyTitle;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://adfest.in/naagrajbuildcon/api/v1/location"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body)['data'];
    });
    // print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 8 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext ctx, index) {
            var propertyTitle = data[index]["title"];
            // print('$propertyTitle');
            return GestureDetector(
              onTap: () {
                setState(() {
                  propertyTitle:
                  context;
                  // print('Pressed ' + propertyTitle);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PropertiesList(propertyTitle),
                  ),
                );
              },
              child: Container(

                alignment: Alignment.center,
                child: Text(
                  data[index]["title"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF550A0A),
                    borderRadius: BorderRadius.circular(15)),
              ),
            );
          }),
    );
  }
}

class PropertiesList extends StatefulWidget {
  final String propertyTitle;
  const PropertiesList(this.propertyTitle);

  @override
  _PropertiesListState createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {
  List data;
  String location;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(data :data,index:index)),
                );
                  // print("detail pressed");

                },
                child: Container(
                  height: 150,
                  child: Card(
// color: Colors.orange,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 70,
                          child: Container(
                            child: Container(
                              height: 210,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  // NetworkImage('https://adfest.in/naagrajbuildcon/api/v1/property?popular=1/data/image=?'+data[index]['image']),
                                  NetworkImage(
                                      'https://adfest.in/naagrajbuildcon/themes/basic/assets/img/' +
                                          data[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 66,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 30,
                                child: Text(
                                  data[index]["location"],
                                  style: TextStyle(                              fontSize: 18,
                                fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 25,
                                  child: Text(
                                    // widget.propertyTitle,
                                    data[index]["title"],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
// Expanded(flex: 25, child: Text('1 BHK, 2 BHK, 3 BHK, 4 BHK, 5 BHK')),
                              Expanded(
                                  flex: 25,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
// child: Icon(
//   Icons.monetization_on,
// ),
                                    ),
                                    // Text('${data[index]["subtext2"]}Lac'),
                                    Text(NumberFormatter.formatter(data[index]["subtext2"])),
                                  ])),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<String> getData() async {
    // print('url'+location);
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/property?location=" + location),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body)['data'];
    });
    return "Success!";
  }

  @override
  void initState() {
    location = '${widget.propertyTitle}';
    super.initState();
    this.getData();
  }
}
class NumberFormatter{
  NumberFormatter(String price);

  static String formatter(String price) {
    try{
      double value = double.parse(price);
      if(value < 100000){
        return value.toStringAsFixed(0)+' Thousand';
      }else if(value >= 100000 && value < (100000*100)){
        double result = value/100000;
        return result.toStringAsFixed(2)+" Lac";
      }else if(value >= (10000000) && value < (10000000*100)){
        double result = value/(10000000);
        return result.toStringAsFixed(2)+" Cr";
      }else if(value >= (1000000000) && value < (1000000*10*100*100*100)){
        double result = value/(1000000000);
        return result.toStringAsFixed(2)+" arab";
      }
    }catch(e){
      print(e);
    }
  }
}