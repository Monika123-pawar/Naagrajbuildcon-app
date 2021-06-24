import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:naagrajbuildcon/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final List data;
  final int index;
  final String contact_no;
  // ignore: non_constant_identifier_names
  const Detail({Key key, this.data, this.index, this.contact_no}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: data[index]['image'],
            child: Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://adfest.in/naagrajbuildcon/themes/basic/assets/img/' +
                          data[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
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
              ),
            ),
          ),
          Container(
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      // Icon(
                      //   Icons.notifications_none,
                      //   color: Colors.white,
                      //   size: 28,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Container(
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
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         property.name,
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 32,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Container(
                //         height: 50,
                //         width: 50,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           shape: BoxShape.circle,
                //         ),
                //         child: Center(
                //           child: Icon(
                //             Icons.favorite,
                //             color: Colors.yellow[700],
                //             size: 20,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 24,
                //     right: 24,
                //     top: 8,
                //     bottom: 16,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.location_on,
                //             color: Colors.white,
                //             size: 16,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             property.location,
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Icon(
                //             Icons.zoom_out_map,
                //             color: Colors.white,
                //             size: 16,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             property.sqm + " sq/m",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.star,
                //             color: Colors.yellow[700],
                //             size: 16,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             property.review + " Reviews",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Container(
                              //   height: 65,
                              //   width: 65,
                              //   // decoration: BoxDecoration(
                              //   //   image: DecorationImage(
                              //   //     image: AssetImage(property.ownerImage),
                              //   //     fit: BoxFit.cover,
                              //   //   ),
                              //   //   shape: BoxShape.circle,
                              //   // ),
                              // ),
                              // SizedBox(
                              //   width: 16,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['title'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    data[index]['location'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700].withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  // Icon(
                                  //   Icons.phone,
                                  //   color: Colors.yellow[700],
                                  //   size: 20,
                                  //
                                  // ),
                                  child: IconButton(
                                    onPressed: _makingPhoneCall,
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.yellow[700],
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: BoxDecoration(
                              //     color: Colors.yellow[700].withOpacity(0.1),
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: Center(
                              //     child: IconButton(
                              //       onPressed: () {
                              //         _textMe();
                              //       },
                              //       icon: Icon(
                              //         Icons.message,
                              //         color: Colors.yellow[700],
                              //         size: 20,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildFeature(Icons.hotel, "3 Bedroom"),
                          buildFeature(Icons.wc, "2 Bathroom"),
                          buildFeature(Icons.kitchen, "1 Kitchen"),
                          buildFeature(Icons.local_parking, "2 Parking"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 16,
                      ),
                      child: Text(
                        "Property Status",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 24,
                      ),
                      child: Text(
                        data[index]['property_status'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 16,
                      ),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 24,
                      ),
                      child: Text(
                        data[index]['details'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 16,
                      ),
                      // child: Text(
                      //   "Photos",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       bottom: 24,
                    //     ),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (_) {
                    //           return DetailScreen();
                    //         }));
                    //       },
                    //       child: ListView(
                    //         physics: BouncingScrollPhysics(),
                    //         scrollDirection: Axis.horizontal,
                    //         shrinkWrap: true,
                    //         children: buildPhoto(data),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeature(IconData iconData, String text) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.yellow[700],
          size: 28,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // List<Widget> buildPhotos(List<String> images) {
  //   List<Widget> list = [];
  //   list.add(SizedBox(
  //     width: 24,
  //   ));
  //   for (var i = 0; i < images.length; i++) {
  //     list.add(buildPhoto(images[i]));
  //   }
  //   return list;
  // }

  Widget buildPhoto(data) {
    // print(data);
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: NetworkImage(
                'https://adfest.in/naagrajbuildcon/themes/basic/assets/img/' +
                    data[index]['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  _makingPhoneCall() async {
    String url = ('tel:' + contact_no);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<String> images = [
    //   "house_06.jpg",
    //   "house_08.jpg",
    //   "house_06.jpg",
    //   "house_08.jpg",
    //   "house_06.jpg",
    //   "house_08.jpg",
    //   "house_06.jpg",
    //   "house_08.jpg",
    //   "house_06.jpg",
    //   "house_08.jpg",
    // ];
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Container(
              child: Center(
                child: Container(
                  // height: 100,
                  child: GridView.count(
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    children: [
                      Card(
                        child: Image.asset('assets/images/house_08.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_06.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_08.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_06.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_08.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_06.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_08.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_06.jpg',
                            fit: BoxFit.fill),
                      ),
                      Card(
                        child: Image.asset('assets/images/house_08.jpg',
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// _makingPhoneCall() async {
//   String url = ('tel:' + contact_no);
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

_textMe() async {
  // Android
  const uri = 'sms:+39 348 060 888?body=hello%20there';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    const uri = 'sms:0039-222-060-888?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
