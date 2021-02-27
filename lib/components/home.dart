import 'package:flutter/material.dart';
import 'package:leaderboard_app/screens/adduser.dart';
import 'package:leaderboard_app/screens/leaderboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:   Container(

        child: RichText(
            text: TextSpan(
                text: "Leader",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: " Board App",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold))
                ])),
      ),backgroundColor: Colors.orange),
      endDrawer: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              ListTile(
                title: Text('🎀 𝐿𝑒𝒶𝒹𝑒𝓇𝐵o𝒶𝓇𝒹 𝒜𝓅𝓅  🎀',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold

                    )),
                contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                trailing: Icon(Icons.arrow_right,
                  color: Colors.white,),
                onTap: () {
                    null;
                },
              ),
              ListTile(tileColor: Colors.redAccent,
                title: Text('Add Screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                trailing: Icon(Icons.input_outlined,
                  color: Colors.white,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddGames()),
                  );
                },
              ),


            ],
          ),
        ),
      ),

      body: LeaderBoard(),
    );
  }
}
