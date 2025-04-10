import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/auth_title.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/credentials_text_field.dart';
import 'package:fitlifts/presentation/screens/auth/login/forgot%20password/forgot_pass_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/elevated_cta.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  final String? email;
  const ForgotPasswordScreen({super.key, this.email});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    widget.email != null
        ? emailController.text = widget.email.toString()
        : emailController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitle(
                h1: "Forgot Your Password?",
                h2: "No worries, we've got your back!",
              ),
              SizedBox(height: 20.h),
              CredentialsField(
                controller: emailController,
                label: "Email",
                focusNode: emailNode,
                hinttext: "Enter your email",
                maxLength: 64,
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: MyColors.greyText,
                ),
                isPassword: false,
              ),

              SizedBox(height: 25.h),
              Consumer<ForgotPassProvider>(
                builder: (context, forgotPassProvider, child) {
                  return forgotPassProvider.isLoading
                      ? CircularProgressLoading()
                      : ElevatedCTA(
                        title: "Send Reset Link",
                        onPressed: () {
                           FocusScope.of(context).unfocus();
                          forgotPassProvider.forgotPassword(
                            emailController.text.toLowerCase().trim(),
                            context,
                          );
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
