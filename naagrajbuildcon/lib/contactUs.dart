import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:naagrajbuildcon/search.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Dio dio = new Dio();
  Map data;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name = "";
  String _email = "";
  String _phone_no = "";
  String _msg = "";

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
      body: SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 80.0, bottom: 10.0, left: 15.0, right: 15.0),
                    child: Form(
                        key: _formKey,
                        // ignore: deprecated_member_use
                        autovalidate: _autoValidate,
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          children: <Widget>[
                            //===> Student Number Text Input starts from here <===
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 6.0,
                                  left: 1.0,
                                  right: 1.0),
                              child: TextFormField(
                                autofocus: false,
                                // focusNode: myFocusNodeEmail,
                                // controller: studentNumberController,
                                // keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                // validator: validateStudentNumber,
                                onSaved: (String val) {
                                  _name = val;
                                },
                              ),
                            ),

                            //===> Email Address Text Input starts from here <===
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.0, bottom: 6.0, left: 1.0, right: 1.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    if (!EmailValidator.validate(value)) {
                                      return 'Please enter a valid email';
                                    }
                                  }
                                  return null;
                                },
                                // validator: validateStudentEmailAddress,
                                onSaved: (String val) {
                                  _email = val;
                                },
                                // controller: studentEmailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                            ),

                            //===> Phone Number Text Input starts from here <===
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.0, bottom: 6.0, left: 1.0, right: 1.0),
                              child: TextFormField(
                                // controller: studentPhoneNumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Phone Number',
                                ),
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[()\d -]{1,15}$')),
                                ],
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter phone number';
                                  }
                                  return null;
                                },
                                // validator: validateStudentPhoneNumber,
                                onSaved: (String val) {
                                  _phone_no = val;
                                },
                              ),
                            ),

                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter message';
                                }
                                return null;
                              },
                              // validator: validateStudentQuery,
                              onSaved: (String val) {
                                _msg = val;
                              },
                              // controller: queryController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Message',
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              maxLines: 3,
                            ),

                            Container(
                                margin: EdgeInsets.only(top: 10.0, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Color(0xFF5C1912),
                                      offset: Offset(0.0, 0.0),
                                      //blurRadius: 20.0,
                                    ),
                                    BoxShadow(
                                      color: Color(0xFF5C1912),
                                      offset: Offset(0.0, 0.0),
                                      //blurRadius: 20.0,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(
                                            0xFF5C1912), //Colors is Olympic blue
                                        Color(0xFF5C1912),
                                      ],
                                      begin: FractionalOffset(0.2, 0.2),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    _validateInputs();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 65.0),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      contactUser();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
    _formKey.currentState.reset();
  }
  // ?name=$_name&email=$_email&number=$_phone_no&mssg=$_msg"
  // https://adfest.in/naagrajbuildcon/api/v1/setting/
  // https://adfest.in/naagrajbuildcon/api/v1/contact/
  // Future postData() async {
  //   final String pathUrl = "https://adfest.in/naagrajbuildcon/api/v1/contact/?";
  //   var data = {
  //     'name': 'mona',
  //     'email': 'example@mail.com.us',
  //     'number': '9821997906',
  //     'mssg': 'example@mail.com.us',
  //   };
  //
  //   var response = await dio.post(pathUrl,
  //       data: data,
  //       options: Options(headers: {
  //         'Content-type': 'application/json;charset=UTF-8',
  //       }));
  //   // return response.data;
  //
  //   if (response.statusCode == 201) {
  //     return response.data;
  //   } else {
  //     throw Exception('Failed to send data.');
  //   }
  // }
  //
  // Future postTest() async {
  //   final uri = 'https://adfest.in/naagrajbuildcon/api/v1/contact/';
  //   var requestBody = {
  //     'name': 'mrp',
  //     'email': 'example@mail.com.us',
  //     'number': '9821997906',
  //     'msg': 'example@mail.com.us',
  //   };
  //
  //   http.Response response = await http.post(
  //
  //     uri,
  //     body: json.encode(requestBody),
  //     headers: {"Content-Type": "application/json"},
  //
  //   );
  //   if (response.statusCode == 201) {
  //     return ((response.body));
  //   } else {
  //     throw Exception('Failed to send data.');
  //   }
  //   print(requestBody['data']);
  // }
  Future<void> contactUser() async {
    String url = 'https://adfest.in/naagrajbuildcon/api/v1/contact/?';
    http. Response response = await post(url, body: {
      'name': _name,
      'email': _email,
      'number':_phone_no,
      'msg': _msg,
    });
    print(response.body);
    data = jsonDecode(response.body);
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   contactUser();
  // }
}
