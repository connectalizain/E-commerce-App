import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/Screens/product_details.dart';
import 'package:hello/widgets/tabBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UnLoginPage extends StatefulWidget {
  UnLoginPage({super.key});

  @override
  State<UnLoginPage> createState() => _UnLoginPageState();
}

class _UnLoginPageState extends State<UnLoginPage> {
  CollectionReference products =
      FirebaseFirestore.instance.collection("Featured_Product");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Mega Mall",
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          )
        ],
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Search Tab Bar
                const SizedBox(height: 10),
                const SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search Product Name",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal()),
                      suffixIconColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Promotions
                SizedBox(
                  height: 160,
                  child: Center(
                    child: ListView(
                      padding: EdgeInsets.all(5),
                      // shrinkWrap: true,

                      scrollDirection: Axis.horizontal,

                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 140,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage('pic1.PNG'))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 140,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('pic1.PNG'))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Categories'),
                        trailing: TextButton(
                            onPressed: () {}, child: Text('See All')),
                      ),
                      tabbar_view(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
            FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return  ListView.builder(
                  shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                           leading: CircleAvatar(backgroundImage: NetworkImage((snapshot.data.docs[index]['Image'])),),
                            title: Text(snapshot.data.docs[index]['Title']),
                            subtitle: Text(snapshot.data.docs[index]['Price']),
                            trailing: TextButton(onPressed: (){  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsView(
                                        data: snapshot.data.docs[index],
                                      )));}, child: Text('View Details'))
                          );
                        });
              } else {
                return const CircularProgressIndicator();
              }
            }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
