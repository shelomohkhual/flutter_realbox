import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {

  // WebViewContainer Variable
  final articleUrl;
  // Accessing Given Parameter of Article Url To Display
  WebViewContainer(this.articleUrl);

  @override
  createState() => _WebViewContainerState(this.articleUrl);
}

class _WebViewContainerState extends State<WebViewContainer> {
  // WebViewContainerState Variable
  final _articleUrl;

  // UniqueKey To Display Specific Widget
  final _key = UniqueKey();

  // Accessing Given Parameter of Article Url To Display
  _WebViewContainerState(this._articleUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                // Unique Key
                key: _key,
                //Allowing JS in WebView
                javascriptMode: JavascriptMode.unrestricted,
                // Article Url To Display
                initialUrl: _articleUrl,
              )
            )
          ],
        )
    );
  }
}
