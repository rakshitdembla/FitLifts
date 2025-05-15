import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewUtils {
  static void infoPages(WebViewController controller,String uri) {
    controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                Center(child: CircularProgressLoading());
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {
                Center(
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: MyColors.greyText),
                  ),
                );
              },
              onWebResourceError: (WebResourceError error) {
                Center(
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: MyColors.greyText),
                  ),
                );
              },
              onNavigationRequest: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(uri));
  }
}
