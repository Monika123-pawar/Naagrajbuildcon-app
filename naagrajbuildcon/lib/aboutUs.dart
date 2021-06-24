import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naagrajbuildcon/search.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Search()),
              ),),
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                // Container(
                //   width: double.infinity,
                //   height: 150,
                //   child: Container(
                //     alignment: Alignment(0.0, 2.5),
                //     child: CircleAvatar(
                //       backgroundImage:
                //       AssetImage('assets/images/NAAGRAJ_Stationary-08.png'),
                //       radius: 70.0,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Another new advertising agency in town ?",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black87,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,//.horizontal
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new  Text(
                              "No, not at all. We started adfest with just one aim, break the monopoly of big advertising agencies in the creative world and let the whole world taste the real fun of advertising skill and the authentic fun of advertising. Every new campaign is new challenge for us which we accepts with full of fun, humour and energy to execute the campaign to make our client and the target audience smile whenever they recall this campaign. A thorough knowledge on markets (consumers) is one of the most important thing we like to use whenever we start ideation of any new campaign for any new business. Information on what people buy, why they buy it, where they buy, how they buy, how frequently they buy etc., are very important and useful. We do conduct a research to obtain such information on regular basis. product positioning strategy is our forte. As an advertising agency we knows the character of advertising medium, we advices a suitable media mix to our client. As we our Knowledge of target market, the media habits and exposure of the target market helps our campaign success. Coordination is another important function of an advertising agency. we ensure a proper coordination between the clients, sales force and the distribution network to ensure long-run success of the advertising programme. our goal of the advertising programme is to assist the efforts of sales persons, distributors and retailers to maximize sales for the client. Research enable us to make stronger presentation to our clients. It helps the copy and art personnel, to create better advertisements for our clients. The fundamental objective of this department is to build and maintain goodwill with the cross sections of public. The tools used in communicating with the public are corporate advertising and publicity. The main job of our agency is to build stronger relations with clients and the various sections of the public — customers, employees, middlemen and shareholders.",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.blueGrey,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
