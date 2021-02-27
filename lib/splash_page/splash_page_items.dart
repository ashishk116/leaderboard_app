import 'package:flutter/material.dart';

// splash page items list

class SplashPageItems {
  Color color;
  String image;
  String title;
  String subTitle;

  SplashPageItems({this.color, this.image, this.title, this.subTitle});
}

List<SplashPageItems> splashItems = [
  // first page
  SplashPageItems(
    color: Colors.red,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "Hello Welcome to Leader Board App:) ",
    subTitle: "Swipe right for app information",
  ),

  // second page
  SplashPageItems(
    color: Colors.deepOrange,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "Dashbaord is showing the lead scorers of the games",
    subTitle: "Swipe --> ",
  ),
  SplashPageItems(
    color: Colors.deepOrangeAccent,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "Through the menubar you can add the new scorer of game",
    subTitle: "Start",
  ),

  // third page
];