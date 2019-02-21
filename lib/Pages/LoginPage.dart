import 'package:flutter/material.dart';
import 'package:FlutterGram/Pages/SignUp.dart';
import 'Home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingControllerUser;
  TextEditingController _textEditingControllerPassword;
  bool isUserEmpty, isPassWordEmpty,canLogin;


  @override
  void initState(){
    super.initState();
    _textEditingControllerUser = TextEditingController();
    _textEditingControllerPassword = TextEditingController();
    isUserEmpty = true;
    isPassWordEmpty = true;
    canLogin = false;
  }

  @override
  void dispose(){
    _textEditingControllerPassword.dispose();
    _textEditingControllerUser.dispose();
    super.dispose();
  }

  checkLogin(){

    if(!isUserEmpty && !isPassWordEmpty){
      setState(() {
        canLogin=true; 
    });
    }else{
       setState(() {
        canLogin=false; 
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(top: 60.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Text(""),
              ),
              //Text FlutterGgram
              Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Fluttergram',
                    style: TextStyle(
                        fontSize: 40.0, fontFamily: 'Pacifico-Regular'),
                  )),
              //InputText username
              Container(
                //padding: EdgeInsets.all(16.0)
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _textEditingControllerUser,
                  onChanged: (text){
                    if(text.isNotEmpty){
                    setState(() {
                     isUserEmpty = false; 
                    });
                    }else{
                      setState(() {
                       isUserEmpty = true; 
                      });
                    }
                    checkLogin();
                  },
                  decoration: InputDecoration(
                      hintText: 'Phone number, email or Username',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              //InputText password
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _textEditingControllerPassword,
                  decoration: InputDecoration(
                      hintText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  onChanged: (text){
                    if(text.isNotEmpty){
                    setState(() {
                     isPassWordEmpty = false; 
                    });
                    }else{
                      setState(() {
                       isPassWordEmpty=true; 
                      });
                    }
                    checkLogin();
                  },
                ),
              ),
              //Button Login
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                width: 360.0,
                height: 50.0,
                child: FlatButton(
                  color: Colors.blue,
                  disabledColor: Colors.blue[200],
                  onPressed:canLogin==false?null:(){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomePage()
                    ));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              //Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot your login details?",
                    style: TextStyle(fontSize: 11.0),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text("Get help signing in.",
                        style: TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.bold)),
                    onPressed: () => {},
                  ),
                ],
              ),

              Expanded(
                flex: 1,
                child: Text(""),
              ),

              //Don't have account?
              Container(
                // padding: EdgeInsets.only(top: 130.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ),
                      Container(
                        width: 45.0,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Text("Sign up.",
                              style: TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
