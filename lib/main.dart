import 'package:flutter/material.dart';
import 'package:leaderboard_app/components/home.dart';
import 'package:leaderboard_app/splash_page/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeenPage(),

    );
  }
}


class SeenPage extends StatefulWidget {
  @override
  _SeenPageState createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool seen = (prefs.getBool("seen") ?? false);
      print("seen = $seen");

      // seen == true? skip
      if(seen) {
        // if not first seen? view sign in page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Home()));
      } else {
        // if first seen? view splash page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => SplashPage()));
      }
    });
  }

  @override
  void initState() {
    // get bool
    getCounter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
