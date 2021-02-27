import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'adduser.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  DatabaseReference databaseReference;
  FirebaseDatabase database =FirebaseDatabase.instance;
  int i = 0;
  int index=3;
  Color my = Colors.brown, CheckMyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Leader",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: " Board",
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold))
                            ])),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Global Rank Board: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),




                  Flexible(
                    child:
                    FirebaseAnimatedList(
                      query: FirebaseDatabase.instance
                          .reference()
                          .child('games'),
                      itemBuilder: (_,DataSnapshot snapshot,Animation<double> animation ,int index){
                        print(snapshot.value);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),

                          child: InkWell(
                            onTap: ()=>{print(snapshot.value[0]['name'])},



                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: i == 0
                                          ? Colors.amber
                                          : i == 1
                                          ? Colors.grey
                                          : i == 2
                                          ? Colors.brown
                                          : Colors.white,
                                      width: 3.0,
                                      style: BorderStyle.solid),
                                  borderRadius:
                                  BorderRadius.circular(5.0)),
                              width: MediaQuery.of(context).size.width,

                              child: Column(

                                children: <Widget>[

                                  Row(

                                    children: <Widget>[

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 15.0),


                                        child: Row(
                                          children: <Widget>[
                                            CircleAvatar(

                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape
                                                            .circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage('https://img.favpng.com/16/7/18/minecraft-drawing-cartoon-player-versus-player-png-favpng-hWHnFkLjti0D0jC9viYkSx5w5.jpg'),
                                                            fit: BoxFit
                                                                .fill)
                                                    ))),
                                          ],
                                        ),
                                      ),



                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10.0),

                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[

                                            Text(snapshot.key,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20)),

                                            Container(
                                                alignment: Alignment
                                                    .centerLeft,
                                                child: null
                                            ),

                                          ],
                                        ),
                                      ),

                                      Flexible(child: Container()),
                                      i == 0
                                          ? Text("🥇", style: r)
                                          : i == 1
                                          ? Text(
                                        "🥈",
                                        style: r,
                                      )
                                          : i == 2
                                          ? Text(
                                        "🥉",
                                        style: r,
                                      )
                                          : Text(''),


                                      Padding
                                        (
                                        padding: EdgeInsets.only(
                                            left: 20.0,
                                            top: 13.0,
                                            right: 20.0),



                                        child: RaisedButton
                                          (
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => AddGames()),
                                            );
                                          },

                                          child: Text(
                                            "Challenge",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          color: Colors.orange[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },

                    ),
                  ),





                ],
              ),
            )),
      ],
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Clicked Challenge'),
        action: SnackBarAction(
            label: 'good', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
