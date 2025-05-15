import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/services/web_view_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class TermsConditionsWeb extends StatefulWidget {
  const TermsConditionsWeb({super.key});

  @override
  State<TermsConditionsWeb> createState() => _TermsConditionsWebState();
}

class _TermsConditionsWebState extends State<TermsConditionsWeb> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    WebViewUtils.infoPages(
      controller,
      "https://sites.google.com/view/fitlifts-terms-and-conditions/home",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryCharcoal,
        centerTitle: true,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(
            color: MyColors.whiteText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
