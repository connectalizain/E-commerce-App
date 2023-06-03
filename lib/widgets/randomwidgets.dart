import 'package:flutter/material.dart';

txtfield(reqdText, {reqdsuffix, required  controller}) {
  return Container(
    height: 50,
    width: 500,
    child: TextField(
      decoration: InputDecoration(
          labelText: reqdText,
          suffix: reqdsuffix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    ),
  );
}