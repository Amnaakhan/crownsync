import 'package:flutter/material.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConnectAccountsPage extends StatefulWidget {
  @override
  _ConnectAccountsPageState createState() => _ConnectAccountsPageState();
}

class _ConnectAccountsPageState extends State<ConnectAccountsPage> {
  final String initialUrl = "https://api.crownsync.ai/connect";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect Accounts'),
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://api.crownsync.ai/return/final')) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => InboxScreen()),
            );
            // Prevent the WebView from navigating to the redirect URL
            return NavigationDecision.prevent;
          }
          // Allow navigation to all other URLs
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}