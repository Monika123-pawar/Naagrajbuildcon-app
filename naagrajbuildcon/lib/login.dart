import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:naagrajbuildcon/forgotPassword.dart';
import 'package:naagrajbuildcon/register.dart';
import 'package:naagrajbuildcon/search.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user_Name = "";
  String password = "";
  bool changedButton = false;
  final _formKey=GlobalKey<FormState>();
  Map data;
String tokens;
  moveToHome(BuildContext context) async{
    if(_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
        loginUser();
      });
      await Future.delayed(Duration(seconds: 1));
      await  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Search()));
      setState(() {
        changedButton = false;
      });
    }

  }
  Future<void> loginUser() async {
    String url = 'https://adfest.in/naagrajbuildcon/api/v1/login';
    http. Response response = await post(url, body: {
      'username' : user_Name,
      'password':password,
      'type':'password'
    });
    data = jsonDecode(response.body)['data'];
    print('hi');
    tokens=data['tokens'];
    print(data['tokens']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Search(tokens:tokens)),
              ),),
        title: Text('Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                // fontFamily: 'sans-serif-light',
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Image.asset(
                  "assets/images/NAAGRAJ_Stationary-08.png",
                  fit: BoxFit.cover,
                  // height: 200,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Welcome $user_Name",
                style: TextStyle(
                    color: Color(0xFF550A0A),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        labelText: "UserName",
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "UserName cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        user_Name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(

                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "Password cannot be empty";
                        }else if(value.length <6)
                        {
                          return "Password length should be at least 8";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:130.0),
                      child: InkWell(
                        onTap:(){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Color(0xFF550A0A),
                      borderRadius: BorderRadius.circular(changedButton?50:8),
                      child: InkWell(
                        onTap: () =>moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width:changedButton? 50:150,
                          height: 50,
                          alignment: Alignment.center,
                          child:changedButton?Icon(Icons.done,color: Colors.white,) :Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          // shape: changedButton?BoxShape.circle:BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(changedButton?50:8),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0,left:30.0),
                      child: Row(
                        children: [
                          Text(
                            "Don't you have account?",
                            style: TextStyle(
                                color: Color(0xFF550A0A),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: InkWell(
                                onTap:(){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (BuildContext context) => Register()));
                                },
                              child: Text(
                                "Register Here",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: (){
                    //      Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    //     },
                    //     child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
