import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productPicture = TextEditingController();

  addProduct() {
    CollectionReference product =
        FirebaseFirestore.instance.collection("product");
    product
        .add({"name": productName.text, "price": productPrice.text, 'picture': productPicture.text})
        .then((value) => print("Product Added"))
        .catchError((e) => print(e));
    productName.clear();
    productPrice.clear();
    productPicture.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: productName,
            ),
            TextField(
              controller: productPrice,
            ),
            TextField(
              controller: productPicture,
            ),
            ElevatedButton(
              onPressed: () {
                addProduct();
              },
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
