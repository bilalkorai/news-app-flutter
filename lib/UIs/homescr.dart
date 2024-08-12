import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/UIs/widgets/news_container.dart';
import 'package:newsapp/controller/fetchnews.dart';
import 'package:newsapp/model/newsart.dart';

class homesreen extends StatefulWidget{
  @override
  State<homesreen> createState() => _homesreenState();
}

class _homesreenState extends State<homesreen> {
  @override
  late newsart Newsart;
  bool isloading = true;
  givenews() async{
    Newsart = await fetchnews.getnews();
    isloading=false;
    setState(() {

    });
  }

  void initState(){
    givenews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body:
      PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
          onPageChanged: (value){
          setState(() {
            isloading = true;
          });
          givenews();
          },
          itemBuilder: (context, index){
        return isloading ? Center(child: CircularProgressIndicator(),) : newscontainer(imgurl: Newsart.imgurl, newsdesc: Newsart.newsdesc, newshead:Newsart.newshead, newsurl: Newsart.newsurl);
      })
    );
  }
}