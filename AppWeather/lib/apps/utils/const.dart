const linkAsset = 'assets/images/weathers/';
class AssetCustom{
  static String getLinkImage (String name) =>'$linkAsset${name.replaceAll(" ", "").toLowerCase()}.png';
}
class Mykey{
  static const String api_token ="f33e152fe62a30f1f848f9d8b1b9e948";
}
class MyLocation{
  static const String x_ ="10,77657";
  static const String y_ ="106,70121";
}