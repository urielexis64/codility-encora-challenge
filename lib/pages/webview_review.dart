import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewReview extends StatefulWidget {
  const WebViewReview({super.key, required this.url});

  final String url;

  @override
  State<WebViewReview> createState() => _WebViewReviewState();
}

class _WebViewReviewState extends State<WebViewReview> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back'), centerTitle: false),
      body: WebView(initialUrl: widget.url),
    );
  }
}
