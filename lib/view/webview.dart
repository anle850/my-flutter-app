import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  // void initState() {
  //   super.initState();
  //   controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           // Update loading bar.
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url.startsWith('https://flutter.dev')) {
  //             return NavigationDecision.navigate;
  //           }
  //           return NavigationDecision.prevent;
  //         },
  //       ),
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: Center(
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse('https://youtube.com')),
        ),
      ),
    );
  }
}
