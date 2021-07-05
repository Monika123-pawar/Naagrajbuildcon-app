import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:naagrajbuildcon/login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String user_Name = "";
  bool changedButton = false;
  final _formKey=GlobalKey<FormState>();
  Map data;
  Map tokens;
  moveToHome(BuildContext context) async{
    if(_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
        forgotPassword();
      });
      await Future.delayed(Duration(seconds: 1));
      await  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
      setState(() {
        changedButton = false;
      });
    }

  }
  Future<void> forgotPassword() async {
    print(user_Name);
    String url = 'https://adfest.in/naagrajbuildcon/api/v1/password';
    http. Response response = await post(url, body: {
      'username' : user_Name,
    });
    data = jsonDecode(response.body);
    print('hi');
    // tokens=data['tokens'];
    // print(data['tokens']);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:80.0),
                child: Image.asset(
                  "assets/images/NAAGRAJ_Stationary-08.png",
                  fit: BoxFit.cover,
                  // height: 200,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Color(0xFF550A0A),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
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
                        // setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 70.0,
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
                            'Submit',
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
