import 'package:flutter/material.dart';

class MyBoxDecoration{
  static boxDecoration({Color? color}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: color,
    );
  }
}