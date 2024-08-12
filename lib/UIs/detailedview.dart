import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ddetailedview extends StatefulWidget{
  String newsUrl;
  String newsHead;
  ddetailedview({super.key, required this.newsUrl, required this.newsHead});

  @override
  State<ddetailedview> createState() => _ddetailedviewState();
}

class _ddetailedviewState extends State<ddetailedview> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Use unrestricted if you need JS, else keep it disabled
      ..loadRequest(Uri.parse(widget.newsUrl));
    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:") ? widget.newsUrl.replaceAll("http:", "https:") : widget.newsUrl;
    });// Correct reference to newsUrl
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.grey.shade400,
       title: Text(widget.newsHead),
     ),
    body: WebViewWidget(
      controller: _controller,
    ),
   );
  }
}