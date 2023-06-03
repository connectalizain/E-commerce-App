import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello/Screens/product_details.dart';

class Test extends StatelessWidget {
  Test({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("product");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsView(
                                        data: snapshot.data.docs[index],
                                      )));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                (snapshot.data.docs[index]['picture'])),
                          ),
                          title: Text(snapshot.data.docs[index]['name']),
                          subtitle: Text(snapshot.data.docs[index]['price']),
                        ),
                      );
                      // print(Text(snapshot.data.docs[index]['name']))
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
