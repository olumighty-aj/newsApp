import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AritclceView extends StatefulWidget {
  final String blogUrl; 
  const AritclceView({super.key, required this.blogUrl});

  @override
  State<AritclceView> createState() => _AritclceViewState();
}

class _AritclceViewState extends State<AritclceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "DENS",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              "NEWS",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                  fontWeight: FontWeight.w800),
            )
          ]),
          centerTitle: true,
          elevation: 0.0,
        ),
      body: Container(
      child: WebView(
        initialUrl: widget.blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),
    );
  }
}
