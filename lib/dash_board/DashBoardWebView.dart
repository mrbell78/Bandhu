import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashBoardWebview extends StatefulWidget {


  @override
  State<DashBoardWebview> createState() => _DashBoardWebviewState();
}

class _DashBoardWebviewState extends State<DashBoardWebview> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.bandhu-bd.org/login'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top: 65),
        child: WebViewWidget(controller: controller));
  }
}
