import 'dart:io';
import 'package:dallah/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_translate/flutter_translate.dart';

class WebViewExample extends StatefulWidget {
  final String url;

  WebViewExample(this.url);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.url,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
      ),
    );
  }
}
