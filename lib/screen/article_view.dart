import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;
  ArticleView({this.url});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Icon(Icons.ac_unit),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),
      body: Container(
          child: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            onPageFinished: (value) {
              setState(() {
                _loading = false;
              });
            },
            onWebViewCreated: ((WebViewController webViewCOntroller) {
              _completer.complete(webViewCOntroller);
            }),
          ),
          _loading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      )),
    );
  }
}
