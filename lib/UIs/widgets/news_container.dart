import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/UIs/detailedview.dart';

class newscontainer extends StatelessWidget{
  String imgurl;
  String newshead;
  String newsdesc;
  String newsurl;
  newscontainer({super.key, required this.imgurl, required this.newsdesc, required this.newshead, required this.newsurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imgurl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(newshead.length>70 ? newshead.substring(0,70) : newshead, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("${newsdesc.toString().substring(0,newsdesc.length-15)}...(read more)", style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ddetailedview(newsUrl: newsurl, newsHead: newshead,)));
                }, child: Text("read more",style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, elevation: 20)),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

}