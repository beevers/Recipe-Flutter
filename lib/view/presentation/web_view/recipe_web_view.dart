import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/controllers/web_view_controller/recipe_web_view_cont.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeWebView extends ConsumerStatefulWidget {
  const RecipeWebView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipeWebViewState();
}

class _RecipeWebViewState extends ConsumerState<RecipeWebView> {
  @override
  void initState() {
    recipeWebViewContrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(const Color(0x00000000))
      // ..setNavigationDelegate(
      //   NavigationDelegate(
      //     onProgress: (int progress) {
      //       // Update loading bar.
      //     },
      //     onPageStarted: (String url) {},
      //     onPageFinished: (String url) {},
      //     onWebResourceError: (WebResourceError error) {},
      //     onNavigationRequest: (NavigationRequest request) {
      //       if (request.url.startsWith('https://www.youtube.com/')) {
      //         return NavigationDecision.prevent;
      //       }
      //       return NavigationDecision.navigate;
      //     },
      //   ),
      // )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: recipeWebViewContrl),
    );
  }
}
