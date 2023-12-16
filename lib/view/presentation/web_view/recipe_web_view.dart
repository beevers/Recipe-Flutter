import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/controllers/web_view_controller/recipe_web_view_cont.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeWebView extends ConsumerStatefulWidget {
  final String url;
  const RecipeWebView({super.key, required this.url});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipeWebViewState();
}

class _RecipeWebViewState extends ConsumerState<RecipeWebView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      recipeWebViewContrl = WebViewController()
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
              if (request.url.startsWith('https://www.xvideos.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await recipeWebViewContrl.canGoBack()) {
          recipeWebViewContrl.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          ),
          title: Text(
            "Recipe",
            style: TextStyle(color: white),
          ),
        ),
        body: Stack(children: [
          Center(
            child: CupertinoActivityIndicator(
              color: black,
            ),
          ),
          WebViewWidget(controller: recipeWebViewContrl),
        ]),
      ),
    );
  }
}
