
import 'package:flutter/cupertino.dart';

class newsart{
  String imgurl;
  String newshead;
  String newsdesc;
  String newsurl;


  newsart({
   required this.imgurl,
   required this.newshead,
    required this.newsdesc,
    required this.newsurl
});

  static newsart fromapitoapp(Map<String,dynamic> article){
    return newsart(
        imgurl: article["urlToImage"] ?? Image.asset("assets/images/aa.png"),
        newshead: article["title"] ?? "--",
        newsdesc: article["content"] ?? "Description not available",
        newsurl: article["url"] ?? "https://news.google.com/home?hl=en-PK&gl=PK&ceid=PK:en"
    );
  }
}