import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResourceWebView extends StatelessWidget {
  final String url;
  final String title;

  const ResourceWebView({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(url))),
    );
  }
}
