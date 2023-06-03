import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

tabbar_view() {
  return Container(
    child: DefaultTabController(
        length: 6,
        child: Column(children: <Widget>[
          ButtonsTabBar(
              // backgroundColor: Colors.grey[300],
              // unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: TextStyle(color: Colors.black),
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Icon(Icons.fastfood_outlined),
                  text: "Food",
                ),
                Tab(
                  icon: Icon(Icons.cake_rounded),
                  text: "Gift",
                ),
                 Tab(
                  icon: Icon(Icons.headphones),
                  text: "Gadgets",
                ),
                 Tab(
                  icon: Icon(Icons.shower_sharp),
                  text: "Fashion",
                ),
                 Tab(
                  icon: Icon(Icons.watch_later),
                  text: "Watches",
                ),
                Tab(
                  icon: Icon(Icons.fastfood_outlined),
                  text: "Food",
                ),
              ])
        ])),
  );
}
