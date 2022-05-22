import 'package:flutter/material.dart';

class MyBoldText{
  static boldtext({Color? color}){
    return  TextStyle(
      fontWeight: FontWeight.bold,
      color:color ?? Colors.black
      );
  }
}