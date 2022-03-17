import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final String url;
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;
  const WebViewScaffold({
    Key key,
    this.appBar,
    @required this.url,
    this.bottomNavigationBar,
    this.floatingActionButton,
  })  : assert(url != null),
        super(key: key);

  @override
  _WebViewScaffoldState createState() => _WebViewScaffoldState();
}

class _WebViewScaffoldState extends State<WebViewScaffold> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      body: Stack(
        children: [
          _buildWebView(),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildWebView() {
    return InAppWebView(
      initialUrl: widget.url,
      shouldOverrideUrlLoading: (controller, url) async {
        return ShouldOverrideUrlLoadingAction.ALLOW;
      },
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            javaScriptEnabled: true,
            debuggingEnabled: false,
          ),
          android: AndroidInAppWebViewOptions(
              domStorageEnabled: true, databaseEnabled: true)),
      onProgressChanged: (_, progress) {
        setState(() {
          this.progress = progress / 100;
        });
      },
    );
  }

  Widget _buildIndicator() {
    return progress < 1
        ? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
          )
        : SizedBox();
  }
}
