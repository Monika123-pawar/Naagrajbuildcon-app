import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:naagrajbuildcon/search.dart';

import 'detail.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List data;

  String _selectedType = "Buy";
  String _selectedLocation = "Panvel";
  String _selectedProperty_type = "Flat";
  String _selectedBudget = '1000000-3300000';
  String selectedSpinnerItem = 'Panvel';
  List location = List();
  List budget = List();
  Future myFutureLocation;
  Future myFutureBudget;

  final String locationUri = 'https://adfest.in/naagrajbuildcon/api/v1/location';
  final String budgetUri = 'https://adfest.in/naagrajbuildcon/api/v1/budget';


  Future<String> fetchData() async {
    var response = await http.get(locationUri);
    if (response.statusCode == 200) {
      var res = await http
          .get(Uri.encodeFull(locationUri), headers: {"Accept": "application/json"});
      var resBody = json.decode(response.body)['data'];
      setState(() {
        location = resBody;
      });
      print('Loaded Successfully');
      // print(location);
      return "Loaded Successfully";
    } else {
      throw Exception('Failed to load data.');
    }
  }
  Future<String> fetchBudget() async {
    var response = await http.get(budgetUri);
    if (response.statusCode == 200) {
      var res = await http
          .get(Uri.encodeFull(budgetUri), headers: {"Accept": "application/json"});
      var resBody = json.decode(response.body)['data'];
      setState(() {
        budget = resBody;
      });
      print('Loaded Successfully');
      // print('budget'+budget[0]['subtext1']+"-"+budget[0]['subtext2']);
      return "Loaded Successfully";
    } else {
      throw Exception('Failed to load data.');
    }
  }
  @override
  void initState() {
    myFutureLocation = fetchData();
    myFutureBudget = fetchBudget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 32,
              child: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      DropdownButton<String>(
                        hint: Text("Type"),
                        value: _selectedType,
                        items: <String>['Buy', 'Rent', 'Resell']
                            .map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          setState(() {
                            _selectedType = val;
                            print('setstate' + _selectedType);
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new DropdownButton(
                        items: location.map((data) {
                          return new DropdownMenuItem(
                            child: new Text(data['title']),
                            value: data['title'].toString(),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _selectedLocation = newVal;
                          });
                        },
                        value: _selectedLocation,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        hint: Text("Property Type"),
                        value: _selectedProperty_type,
                        items: <String>[
                          'Flat',
                          'House ',
                          'Row House',
                          'Godown',
                          'Shop',
                          'Office'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          setState(() {
                            _selectedProperty_type = val;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // DropdownButton(
                      //   items: budget.map((data) {
                      //     return new DropdownMenuItem(
                      //       child: new Text(data['subtext1']+"-"+data['subtext2']),
                      //       value: (data['subtext1'])+"-"+(data['subtext2']),
                      //     );
                      //   }).toList(),
                      //   onChanged: (newVal) {
                      //     setState(() {
                      //       // print('newval'+newVal.toString());
                      //       _selectedBudget = newVal.toString();
                      //     });
                      //   },
                      //   value: _selectedBudget,
                      // ),
                      DropdownButton<String>(
                        hint: Text("Property Budget"),
                        value: _selectedBudget,
                        items: <String>[
                          '3300000-100000000',
                          '1000000-3300000',
                          '20000-100000',
                          '100-10',
                          '1000-100'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          setState(() {
                            _selectedBudget = val;
                          });
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 28,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor,
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterListPage(
                      selectedType: _selectedType,
                      selectedLocation: _selectedLocation,
                      selectedProperty_type: _selectedProperty_type,
                      selectedBudget: _selectedBudget),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF550A0A),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterListPage extends StatefulWidget {
  final String selectedType;
  final String selectedLocation;
  final String selectedProperty_type;
  final String selectedBudget;
  const FilterListPage(
      {this.selectedType,
      this.selectedLocation,
      this.selectedProperty_type,
      this.selectedBudget});
  @override
  _FilterListPageState createState() => _FilterListPageState();
}

class _FilterListPageState extends State<FilterListPage> {
  List data;
  // "https://adfest.in/naagrajbuildcon/properties?type=${selectedType}"&location=${selectedLocation}&property_type=${selectedProperty_type}&budget=${selectedBudget}
  Future<String> getData(selectedType, selectedLocation, selectedProperty_type,
      selectedBudget) async {
    // print(selectedBudget.runtimeType);
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/property?type=${selectedType}&location=${selectedLocation}&property_type=${selectedProperty_type}&budget=${selectedBudget}"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body)['data'];
    });
    // print(data);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    var selectedType = widget.selectedType.toLowerCase();
    // print(selectedType);
    var selectedLocation = widget.selectedLocation.toLowerCase();
    var selectedProperty_type = widget.selectedProperty_type.toLowerCase();
    var selectedBudget = widget.selectedBudget.toLowerCase();
    this.getData(
        selectedType, selectedLocation, selectedProperty_type, selectedBudget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Search()),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: new ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: data == null ? 0: data.length,
                itemBuilder: (BuildContext context, int index) {
                  String price = '';
                  price = data[index]['subtext2'];
                  double pr = double.parse(price);
                  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: pr);
                  MoneyFormatterOutput fo = fmf.output;
                  // Text("Data Not Found")
                    return data == null? Text("Data Not Found"): GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Detail(data: data, index: index)),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.only(
                            bottom: 20, right: 5, left: 5, top: 20),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
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
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[700],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  width: 80,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "FOR " + data[index]['sub_category'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data[index]['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          fmf
                                              .copyWith(
                                              symbol: '₹',
                                              amount: pr,
                                              compactFormatType:
                                              CompactFormatType.short)
                                              .output
                                              .compactSymbolOnLeft,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 14,
                                            ),

                                            SizedBox(
                                              width: 2,
                                            ),

                                            Text(
                                              data[index]['location'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),

                                            SizedBox(
                                              width: 2,
                                            ),

                                            // Icon(
                                            //   Icons.zoom_out_map,
                                            //   color: Colors.white,
                                            //   size: 16,
                                            // ),

                                            // SizedBox(
                                            //   width: 4,
                                            // ),
                                            //
                                            // Text(
                                            //   // property.sqm +
                                            //   " sq/m",
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 14,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // Icon(
                                            //   Icons.star,
                                            //   color: Colors.white,
                                            //   size: 14,
                                            // ),

                                            // SizedBox(
                                            //   width: 4,
                                            // ),
                                            // Text(
                                            //   values[values.length],
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 14,
                                            //   ),
                                            // ),

                                            // Text(
                                            //   // property.review +
                                            //   " Reviews",
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 14,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // listOfWidgets(data[index]['subtext1']),
                                            Text(
                                              data[index]['subtext1'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  letterSpacing: 2.0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
