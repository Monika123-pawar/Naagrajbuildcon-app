import 'dart:io';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:naagrajbuildcon/aboutUs.dart';
import 'package:naagrajbuildcon/data.dart';
import 'package:naagrajbuildcon/filter.dart';
import 'package:naagrajbuildcon/detail.dart';
import 'package:naagrajbuildcon/filterPage.dart';
import 'package:naagrajbuildcon/notification.dart';
import 'package:naagrajbuildcon/profile.dart';
import 'package:naagrajbuildcon/residentialProperties.dart';
import 'package:naagrajbuildcon/searchPage.dart';
import 'package:naagrajbuildcon/widgets/makeCall.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:network_info_plus/network_info_plus.dart';

import 'connectionStatusSingleton.dart';
import 'contactUs.dart';
import 'login.dart';
import 'messagePage.dart';

class Search extends StatefulWidget {
  final String tokens;
  const Search({Key key, this.tokens}):super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();

  List data;
String type='';
  String contact_no;

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;

  String get tokens => null;//this.tokens

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/property?popular=1"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body)['data'];
    //     print('data');
        setState((){});
    // this.setState(() {
    //   if(response.body.isNotEmpty) {
    //     data = json.decode(response.body)['data'];
    //     print('data');
    //   }else{
    //     return "data is not loaded";
    //   }
    //
    // });
    return "Success!";
  }
  Future<String> makingCall() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://adfest.in/naagrajbuildcon/api/v1/setting/"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      if(response.body.isNotEmpty) {
        data = json.decode(response.body)['data'];
        contact_no=data[5]['s_value'];
      }
    });
    // print(data[5]['s_value']);
    return "Success!";
  }
  @override
  void initState() {
    super.initState();
    // connectionStatus.initialize();
    GetConnect();
    this.getData();
    this.makingCall();

  }

  List<Property> properties = getPropertyList();

  @override
  Widget build(BuildContext context) {
    print(data[0]['tokens']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // title: Image.asset(
          //   "NAAGRAJ_Stationary-08.png",
          //   fit: BoxFit.contain,
          //   height: 72,
          // ),
        actions: [
          IconButton(icon:  Icon(
            Icons.login,
            color: Colors.white,
            size: 25,
          ), onPressed: (){

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Login()));
          }),
           // Text(
           //    "Login",
           //    style: TextStyle(
           //      fontSize: 18,
           //      fontWeight: FontWeight.bold,
           //      color: Colors.white,
           //    ),
           //  ),

          IconButton(icon:  Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 25,
          ), onPressed: (){

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => NotificationPage(tokens)));
          })
        ],
          ),
      body:  isInternetOn
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 5, left: 24, right: 24, bottom: 16),
          //   child: TextField(
          //     style: TextStyle(
          //       fontSize: 28,
          //       height: 1,
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       hintStyle: TextStyle(
          //         fontSize: 28,
          //         color: Colors.grey[400],
          //       ),
          //       enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.grey[400]),
          //       ),
          //       focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.grey[400]),
          //       ),
          //       border: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.grey[400]),
          //       ),
          //       suffixIcon: Padding(
          //         padding: EdgeInsets.only(left: 16),
          //         child: Icon(
          //           Icons.search,
          //           color: Colors.grey[400],
          //           size: 28,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          // Padding(
          //   padding: EdgeInsets.only(top: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           height: 32,
          //           child: Stack(
          //             children: [
          //               ListView(
          //                 physics: BouncingScrollPhysics(),
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   SizedBox(
          //                     width: 24,
          //                   ),
          //                   InkWell(
          //                     onTap: (){
          //                       // Navigator.push(
          //                       //     context,
          //                       //     MaterialPageRoute(builder: (context) => FilterPage()));
          //                       // setState(() {
          //                       //   type='Buy';
          //                       //   filterData();
          //                       //
          //                       // });
          //                       //
          //                     },
          //                       child:  Container(
          //                         padding: EdgeInsets.symmetric(horizontal: 12),
          //                         margin: EdgeInsets.only(right: 12),
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.all(
          //                               Radius.circular(5),
          //                             ),
          //                             border: Border.all(
          //                               color: Colors.grey[300],
          //                               width: 1,
          //                             )),
          //                         child: Center(
          //                           child: Text(
          //                             'Buy',
          //                             style: TextStyle(
          //                               fontSize: 16,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                   ),
          //                   // buildFilter("Price"),
          //                   buildFilter("Location"),
          //                   buildFilter("Flats"),
          //                   buildFilter("Budget"),
          //                   SizedBox(
          //                     width: 8,
          //                   ),
          //                 ],
          //               ),
          //               Align(
          //                 alignment: Alignment.centerRight,
          //                 child: Container(
          //                   width: 28,
          //                   decoration: BoxDecoration(
          //                     color: Colors.brown,
          //                     gradient: LinearGradient(
          //                       begin: Alignment.centerRight,
          //                       end: Alignment.centerLeft,
          //                       colors: [
          //                         Theme.of(context).scaffoldBackgroundColor,
          //                         Theme.of(context)
          //                             .scaffoldBackgroundColor
          //                             .withOpacity(0.0),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           _showBottomSheet();
          //         },
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 16, right: 24),
          //           child: Text(
          //             "Filters",
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          FilterPage(),
          Padding(
            padding: EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 12),
            child: Row(
              children: [
                Text(
                  "Popular Properties",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 5,
            child:data!=null? new ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                final String tagName = data[index]['subtext1'];
                String price = '';
                price = data[index]['subtext2'];
                double pr = double.parse(price);
                FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: pr);
                MoneyFormatterOutput fo = fmf.output;
                return  GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detail(data: data, index: index,contact_no:contact_no)),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 24),
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
                                      NumberFormatter.formatter(price),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // Text(
                                    //   fmf
                                    //       .copyWith(
                                    //           symbol: '₹',
                                    //           amount: pr,
                                    //           compactFormatType:
                                    //               CompactFormatType.short)
                                    //       .output
                                    //       .compactSymbolOnLeft,
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
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
                                          width: 4,
                                        ),

                                        Text(
                                          data[index]['location'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 8,
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
            ):Text('Loading'),
          ),

          Expanded(
            flex: 1,
            child: ResidentialProperties(),
          ),
        ],
      ): buildAlertDialog(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("NaagrajBuildcon"),
              accountEmail:
                  Text("info@naagrajbuildcon.com\nsale@naagrajbuildcon.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.white
                        : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "NAAGRAJ_Stationary-08.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Contact Us',
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => ContactUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'About Us',
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Color(0xFF550A0A),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Search()));
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              // title: 'Home',
              highlightColor: Color(0xFF550A0A),
              focusColor: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>showBottomSheet()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              // title: 'Home',
              highlightColor: Color(0xFF550A0A),
              focusColor: Colors.white,
            ),
            IconButton(
                onPressed:_makingPhoneCall,
              // onPressed: () {
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (BuildContext context) =>_makingPhoneCall()));
              // },
              icon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              highlightColor: Color(0xFF550A0A),
              focusColor: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => ContactUs()));
              },
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              // title: 'Home',
              highlightColor: Color(0xFF550A0A),
              focusColor: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Profile()));
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
                semanticLabel: 'Profile',
              ),
              // title: 'Home',
              highlightColor: Color(0xFF550A0A),
              focusColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(String filterName) {
//     Future<String> getDataBuy() async {
//       var response = await http.get(
//           Uri.encodeFull(
//               "https://adfest.in/naagrajbuildcon/properties?type=Buy&location=Belapur&property_type=residential&budget="),
//           headers: {"Accept": "application/json"});
//
//       this.setState(() {
//         data = json.decode(response.body)['data'];
//       });
//
//       return "Success!";
//     }
//
//     getDataBuy();
// print(filterName);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.grey[300],
            width: 1,
          )),
      child: Center(
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // List<Widget> buildProperties(){
  //   List<Widget> list = [];
  //   for (var i = 0; i < properties.length; i++) {
  //     list.add(
  //       Hero(
  //         tag: properties[i].frontImage,
  //         child: buildProperty(properties[i], i)
  //       )
  //
  //     );
  //   }
  //   return list;
  // }

  Widget buildProperty(List data, int index) {

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Detail()),
        // );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 24),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          height: 210,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(property.frontImage),
          //     fit: BoxFit.cover,
          //   ),
          // ),
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
                      "FOR " + data[0]['sold'],
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          r"$" + data[index]['subtext1'],
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data[index]['location'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.zoom_out_map,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              // property.sqm +
                              " sq/m",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              // property.review +
                              " Reviews",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
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
  }

  Widget listOfWidgets(List<String> item) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < item.length; i++) {
      list.add(Container(
          child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          item[i],
        ),
      )));
    }
    return Wrap(
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 2.0, // gap between lines
        children: list);
  }

  // ignore: missing_return
  Widget _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () =>
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) => Search()),
                      ),),
              ),
            body:Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterPage(),
                ],
              ),
            )
          );
        });
  }

  Widget showBottomSheet() {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => Search()),
                ),),
        ),
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilterPage(),
            ],
          ),
        )
    );
  }

  _makingPhoneCall() async {
    String url = ('tel:'+contact_no);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Future<String> filterData() async {
      var response = await http.get(
          Uri.encodeFull(
              "https://adfest.in/naagrajbuildcon/properties?type=${this.type}&location=Belapur&property_type=residential&budget="),
          headers: {"Accept": "application/json"});

      this.setState(() {
        data = json.decode(response.body)['data'];
      });
      return "Success!";
    }
  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
  Center ShowWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              " Your are connected to ${iswificonnected ? "WIFI" : "MOBILE DATA"}"),
          // Text(iswificonnected ? "$wifiBSSID" : "Not Wifi"),
          // Text("$wifiIP"),
          // Text("$wifiName")
        ],
      ),
    );
  }
  Center ShowMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }
  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {

      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {

      iswificonnected = true;
      // setState(() async {
      //   // wifiBSSID = await (Connectivity().getWifiBSSID());
      //   // wifiIP = await (Connectivity().getWifiIP());
      //   // wifiName = await (Connectivity().getWifiName());
      //   //  wifiBSSID = await (NetworkInfo().getWifiBSSID());
      //   //  wifiIP = await (NetworkInfo().getWifiIP());
      //   //  wifiName = await (NetworkInfo().getWifiName());
      // });

    }
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