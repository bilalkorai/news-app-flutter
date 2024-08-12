import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newsapp/model/newsart.dart';
class fetchnews{
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];
  static Future<newsart> getnews() async{
    final random = new Random();
    var element = sourcesId[random.nextInt(sourcesId.length)];

    Response response= await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$element&apiKey=94faba7a18a0495784f939cf17814fcb"));
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];


    final newrandom = new Random();
    var myarticle = articles[newrandom.nextInt(articles.length)];


    return newsart.fromapitoapp(myarticle);
  }
}