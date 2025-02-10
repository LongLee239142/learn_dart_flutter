import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const linkAsset = 'assets/images/weathers/';
class AssetCustom{
  static String getLinkImage (String name) =>'$linkAsset${name.replaceAll(" ", "").toLowerCase()}.png';
}
class Mykey{
  static const String api_token ="f33e152fe62a30f1f848f9d8b1b9e948";
}
class MyLocation{
  static const String x_ ="21,02838";
  static const String y_ ="105,84616";
}

Widget createTemp(num temp , {double size = 100}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$temp',
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        '0',
        style: TextStyle(
          fontSize: size/3,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );

}