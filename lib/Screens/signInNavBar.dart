import 'package:flutter/material.dart';
import 'package:hello/Screens/signin.dart';
import 'package:hello/Screens/unlogin.dart';

class Sign_In_NavBar extends StatefulWidget {
  const Sign_In_NavBar({super.key});

  @override
  State<Sign_In_NavBar> createState() => _Sign_In_NavBarState();
}

class _Sign_In_NavBarState extends State<Sign_In_NavBar> {
  int activeTab = 3;
  Widget currentScreen = const SignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    activeTab = 0;
                    currentScreen =  UnLoginPage();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: activeTab == 0 ? Colors.blue : Colors.black,
                    ),
                    Text('HOME')
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    activeTab = 1;
                    //   currentScreen = const Screen2();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.monitor_heart,
                      color: activeTab == 1 ? Colors.blue : Colors.black,
                    ),
                    Text('WISH LIST')
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  // activeTab = 2;
                  setState(() {
                    activeTab = 2;
                    //   currentScreen = const Screen3();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.local_grocery_store_sharp,
                      color: activeTab == 2 ? Colors.blue : Colors.black,
                    ),
                    Text('ORDERS')
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    activeTab = 3;
                    currentScreen = const SignIn();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: activeTab == 3 ? Colors.blue : Colors.black,
                    ),
                    Text("LOGIN")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
