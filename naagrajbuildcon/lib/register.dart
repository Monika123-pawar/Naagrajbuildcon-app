import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naagrajbuildcon/login.dart';
import 'package:naagrajbuildcon/search.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String user_Name;
  String f_Name;
  String l_Name;
  String email;
  String mobile;
  String confirmPassword;
  String password;
  var confirmPass;
  String _radioSelected = "1";
  String _radioVal;
  Map data;
  File _image ;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  _imgFromCamera() async {

    File image = (await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    )) as File;

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = (await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    )) as File;

    setState(() {
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                ),),
          title: Text('Register User',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  // fontFamily: 'sans-serif-light',
                  color: Colors.white)),
        ),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                // ignore: deprecated_member_use
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    // new Container(
                    //   height: 150.0,
                    //   color: Colors.white,
                    //   child: new Column(
                    //     children: <Widget>[
                    //       // Padding(
                    //       //   padding: EdgeInsets.only(top: 20.0),
                    //       //   child: new Stack(fit: StackFit.loose, children: <Widget>[
                    //       //     new Row(
                    //       //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       //       mainAxisAlignment: MainAxisAlignment.center,
                    //       //       children: <Widget>[
                    //       //         new Container(
                    //       //             width: 140.0,
                    //       //             height: 140.0,
                    //       //             decoration: new BoxDecoration(
                    //       //               shape: BoxShape.circle,
                    //       //               image: new DecorationImage(
                    //       //                 image: new ExactAssetImage(
                    //       //                     'assets/images/owner.jpg'),
                    //       //                 fit: BoxFit.cover,
                    //       //               ),
                    //       //             ),
                    //       //         ),
                    //       //       ],
                    //       //     ),
                    //       //     // Container(
                    //       //     //   child: ProfileIamge(),
                    //       //     // ),
                    //       //     Padding(
                    //       //         padding: EdgeInsets.only(top: 90.0, right: 100.0),
                    //       //         child: new Row(
                    //       //           mainAxisAlignment: MainAxisAlignment.center,
                    //       //           children: <Widget>[
                    //       //             InkWell(
                    //       //                  onTap: (){
                    //       //                    // Navigator.of(context).pushReplacement(
                    //       //                    //     MaterialPageRoute(builder: (BuildContext context) =>  ProfileIamge()));
                    //       //
                    //       //                },
                    //       //               child: new CircleAvatar(
                    //       //                 backgroundColor: Colors.red,
                    //       //                 radius: 25.0,
                    //       //                 child: new IconButton(
                    //       //                   onPressed: (){
                    //       //                     // Navigator.of(context).pushReplacement(
                    //       //                     //     MaterialPageRoute(builder: (BuildContext context) =>  ProfileIamge()));
                    //       //
                    //       //                     print("clicked icon");
                    //       //                   },
                    //       //                   icon: Icon(
                    //       //                     Icons.camera_alt,
                    //       //                     color: Colors.white,
                    //       //                   ),
                    //       //                 ),
                    //       //               ),
                    //       //             )
                    //       //           ],
                    //       //         )),
                    //       //   ]),
                    //       // )
                    //       Padding(
                    //         padding: EdgeInsets.only(top: 20.0),
                    //         child: Center(
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               _showPicker(context);
                    //             },
                    //             child: CircleAvatar(
                    //               radius: 55,
                    //               backgroundColor: Colors.brown,
                    //               child: _image != null
                    //                   ? ClipRRect(
                    //                 borderRadius: BorderRadius.circular(50),
                    //                 child: Image.file(
                    //                   _image,
                    //                   width: 100,
                    //                   height: 100,
                    //                   fit: BoxFit.fitHeight,
                    //                 ),
                    //               )
                    //                   : Container(
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.grey[200],
                    //                     borderRadius: BorderRadius.circular(50)),
                    //                 width: 100,
                    //                 height: 100,
                    //                 child: Icon(
                    //                   Icons.camera_alt,
                    //                   color: Colors.grey[800],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    new Container(
                      color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0 ,top:0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'User Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Enter Your User Name",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter user name';
                                          }
                                          return null;
                                        },
                                        onSaved: (String val) {
                                          user_Name = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'First Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Enter Your First Name",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter name';
                                          }
                                          return null;
                                        },
                                        onSaved: (String val) {
                                          f_Name = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Last Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Enter Your Last Name",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter last name';
                                          }
                                          return null;
                                        },
                                        onSaved: (String val) {
                                          l_Name = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Email ID',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child:TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Enter Your Email Id",
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter email';
                                          }
                                          return null;
                                        },
                                        onSaved: (String val) {
                                          email = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Mobile',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Enter Mobile Number",
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^[()\d -]{1,15}$')),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter name';
                                          }
                                          return null;
                                        },
                                        onSaved: (String val) {
                                          mobile = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          ' Password',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Password",
                                        ),
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: (value) {
                                          confirmPass = value;
                                          if (value.isEmpty) {
                                            return "Please Enter New Password";
                                          } else if (value.length < 8) {
                                            return "Password must be at least 8 characters long";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String val) {
                                          password = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Confirm Password',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText: "Confim Password",
                                        ),
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please Re-Enter New Password";
                                          } else if (value.length < 8) {
                                            return "Password must be at least 8 characters long";
                                          } else if (value != confirmPass) {
                                            return "Password must be same as above";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String val) {
                                          confirmPassword = val;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 17.0, right: 25.0, top:10.0),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(children: [
                                          Radio(
                                            value: "1",
                                            groupValue: _radioSelected,
                                            activeColor: Colors.blue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioSelected = value;
                                                _radioVal = 'Are you an agent?';
                                              });
                                            },
                                          ),
                                          Text('Are you an agent?',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],),
                                        Row(children: [
                                          Radio(
                                            value: "2",
                                            groupValue: _radioSelected,
                                            activeColor: Color(0xFF550A0A),
                                            onChanged: (value) {
                                              setState(() {
                                                _radioSelected = value;
                                                _radioVal = 'Are you property owner?';
                                              });
                                            },
                                          ),
                                          Text('Are you property owner?',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],),
                                        Row(children: [
                                          Radio(
                                            value: "3",
                                            groupValue: _radioSelected,
                                            activeColor: Color(0xFF550A0A),
                                            onChanged: (value) {
                                              setState(() {
                                                _radioSelected = value;
                                                _radioVal = 'Are you looking for property?';
                                              });
                                            },
                                          ),
                                          Text('Are you looking for property?',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 30.0, bottom: 5 ,left: 130.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color:  Color(0xFF5C1912),
                                      offset: Offset(0.0, 0.0),
                                      //blurRadius: 20.0,
                                    ),
                                    BoxShadow(
                                      color:  Color(0xFF5C1912),
                                      offset: Offset(0.0, 0.0),
                                      //blurRadius: 20.0,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF5C1912), //Colors is Olympic blue
                                        Color(0xFF5C1912),
                                      ],
                                      begin: FractionalOffset(0.2, 0.2),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: MaterialButton(
                                  onPressed:  _validateInputs,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 17.0),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      profileUser();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }

    _formKey.currentState.reset();
  }
  Future<void> profileUser() async {
    String url = 'https://adfest.in/naagrajbuildcon/api/v1/user';
    http. Response response = await post(url, body: {
      'username' : user_Name,
      'f_name': f_Name,
      'l_name': l_Name,
      'mobile':mobile,
      'email': email,
      'password':confirmPassword,
      'role_id':_radioSelected,
    });
    print(response.body);
    data = jsonDecode(response.body);
  }

}
