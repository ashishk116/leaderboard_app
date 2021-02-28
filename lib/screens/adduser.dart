
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';


class AddGames extends StatefulWidget {
  @override
  _AddGamesState createState() => _AddGamesState();
}
final FirebaseDatabase database = FirebaseDatabase.instance;

class _AddGamesState extends State<AddGames> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final gamesname = TextEditingController();
  final scorername = TextEditingController();
  final scored = TextEditingController();
  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day) ;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

DataSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.orange,
          title: Text('Please Add Game & Score'),
        ),
        body: Column(
          children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 40, 0,10),
               child: Text('Add a Game'),
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: gamesname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Game Name',
                    hintText: 'Enter valid mail id as Temple Run'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0,10),
              child: Text('Name of Scorer'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: scorername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as Ashish'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0,10),
              child: Text('Score Scored by scorer'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: scored,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '15000pts',
                    hintText: 'Enter valid mail id as 15000pts'
                ),
              ),
            ),
          FlatButton(onPressed: ()=>{

          database.reference().child("games").update(
            {gamesname.text: [{
            "name":scorername.text,
            "score":scored.text,
              "date":formatter.format(now).toString()
          }]},
          )
          }, child: Text('Submit'),
            color: Colors.blue,

          )
          ],
        ),
      ),
    );
  }
}