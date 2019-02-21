import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  bool _like,_bookmark;
  @override
  void initState(){
    super.initState();
    _like =false;
    _bookmark =false;
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          listOfStatus(),
          listOfPost(),
          bottomToolbar()
        ],
      )
    );
  }

  Container bottomToolbar() {
    return Container(
          height: 38,
          color: Colors.white,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Icon(Icons.home,color: Colors.black,size: 28),
              ),
              Expanded(child: Icon(Icons.search,color: Colors.black,size: 28)),
              Expanded(child: Icon(Icons.add,color: Colors.black,size: 28)),
              Expanded(child: Icon(Icons.local_movies,color: Colors.black,size: 28)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: statusBuilder('images/person1.jpg', 20, false, true),
              ),
            ],
          ),
        );
  }

  Widget listOfStatus() {
    return Container(
          height: 70,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context,int index){
                    return statusBuilder('images/person1.jpg', 55, true, true);
                  },
                ),
              ),
            ],
          ),
        );
  }

  Widget listOfPost() {
    return Expanded(
      child: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context,int index){
        return postBuilder("hey_zaman", 'images/person1.jpg',_like,_bookmark);
      },
    ),
    );
  }

  Container postBuilder(String username, String url,bool like,bool bookmar) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 0.4, color: Colors.grey))),
      margin: EdgeInsets.only(top: 0, bottom: 8),
      //height: 500,
      child: Column(
        children: <Widget>[
          Container(
            height: 35,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                statusBuilder(url, 26, false, true),
                Text(
                  username,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Expanded(
                  child: Text(""),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
              //height: 350,
              child: Image.asset(
            url,
            fit: BoxFit.fitWidth,
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.5),
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 30,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                         _like = !like; 
                        });
                        },
                      icon: Icon(
                      like==true?Icons.favorite: Icons.favorite_border,
                      color:like==true?Colors.red: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                ),
                Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                ),
                Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(""),
                ),
                Container(
                  width: 30,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                         _bookmark=!bookmar; 
                        });
                        },
                      icon: Icon(
                      bookmar==true?Icons.bookmark: Icons.bookmark_border,
                      color:bookmar==true?Colors.blue: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  "1,034 likes",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "$username",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                ),
                Text(
                  "Hello I am $username",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container statusBuilder(String url, double size, bool boder, bool color) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: boder == false
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                  width: 2, color: color == true ? Colors.red : Colors.grey),
            ),
      margin: EdgeInsets.all(5),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                //fit: BoxFit.fill,
                image: AssetImage(url))),
        //child: DecorationImage(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: Text("Fluttergram",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Pacifico-Regular',
              fontSize: 20),
          textAlign: TextAlign.start),
      centerTitle: false,
      actions: <Widget>[
        Transform.rotate(
            angle: pi / 25,
            child: IconButton(
              onPressed: (){},
                icon: Icon(
              Icons.cast,
              color: Colors.black,
            ))),
        Transform.rotate(
            angle: -pi / 8,
            child: IconButton(
              onPressed: (){},
                icon: Icon(
              Icons.send,
              color: Colors.black,
            ))),
      ],
    );
  }
}
