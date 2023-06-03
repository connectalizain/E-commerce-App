import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  var data;
  ProductDetailsView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: 
      Text("${data['Title']}"),),
    );
  }
}
