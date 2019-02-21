import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:FlutterGram/Pages/LoginPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _editingControllerPhone;
  TextEditingController _editingControllerEmail;
  bool isEmailEmpty,isPhoneEmpty,isNextEnable;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _editingControllerEmail = TextEditingController();
    _editingControllerPhone = TextEditingController();
    isEmailEmpty = true;
    isPhoneEmpty = true;
    isNextEnable = false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(""),
            ),
            Container(
              height: 130,
              width: 130,
              child: SvgPicture.asset('images/usericon.svg'),
            ),
            //Tabs
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TabBar(
                indicatorColor: Colors.black,
                controller: _tabController,
                
                tabs: <Widget>[
                  Tab(
                      child:
                          Text("PHONE", style: TextStyle(color: Colors.black))),
                  Tab(
                      child: Text(
                    "EMAIL",
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
            ),

            //TabView
            Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  //Phone
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _editingControllerPhone,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            border: OutlineInputBorder(),
                            prefixText: 'In +91',
                            //fillColor: Colors.black
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text){
                            if(text.isNotEmpty){
                              setState(() {
                               isNextEnable=true;
                              });
                            }else{
                              setState(() {
                               isNextEnable = false; 
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  //Email
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            //prefixText: 'In +91',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _editingControllerEmail,
                          onChanged: (text){
                            if(text.isNotEmpty){
                              setState(() {
                               isNextEnable=true;
                              });
                            }else{
                              setState(() {
                               isNextEnable = false; 
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: 310.0,
              height: 50.0,
              child: FlatButton(
                color: Colors.blue,
                disabledColor: Colors.blue[200],
                onPressed: isNextEnable==false?null:(){},
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Text(""),
            ),
            //Already Have an account?
            Container(
              //alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 11.0),
                    ),
                    Container(
                      width: 45.0,
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Text("Log in.",
                              style: TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
