part of "login_imports.dart";

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    emailNode.dispose();
    passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: MyColors.primaryCharcoal,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: MyColors.primaryCharcoal,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: MyColors.whiteText),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitle(h1: "Log in", h2: "Welcome back, champion!"),
              SizedBox(height: 20.h),
              CredentialsField(
                controller: emailController,
                label: "Email",
                focusNode: emailNode,
                hinttext: "Enter your email",
                maxLength: 64,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passNode);
                },
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: MyColors.greyText,
                ),
                isPassword: false,
              ),

              SizedBox(height: 15.h),
              CredentialsField(
                controller: passController,
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                label: "Password",
                focusNode: passNode,
                hinttext: "••••••••••",
                maxLength: 52,
                prefixIcon: Icon(
                  Icons.lock_open_outlined,
                  color: MyColors.greyText,
                ),
                isPassword: true,
              ),
              SizedBox(height: 10.h),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      ForgotPasswordScreenRoute(
                        email: emailController.text.trim().toLowerCase(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(41, 121, 255, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return loginProvider.isLoading
                      ? CircularProgressLoading()
                      : ElevatedCTA(
                        title: "Log In",
                        onPressed: () {
                          loginProvider.loginWithEmailPassword(
                            emailController.text.toLowerCase().trim(),
                            passController.text,
                            context,
                          );
                        },
                      );
                },
              ),
              SizedBox(height: 17.h),
              DivideTitle(title: "Or"),
              SizedBox(height: 15.h),
              Consumer<SocialLoginProvider>(
                builder: (context, socialLoginProvider, child) {
                  return socialLoginProvider.isLoading
                      ? Center(
                        child: CircularProgressIndicator(
                          color: MyColors.whiteText,
                        ),
                      )
                      : SocialLoginButton(
                        title: "Continue with Google",
                        iconImage: AssetImage(Assets.assetsGoogle),
                        onTap: () {
                          socialLoginProvider.continueWithGoogle(context);
                        },
                      );
                },
              ),
              SizedBox(height: 15.h),
              Platform.isIOS
                  ? SocialLoginButton(
                    title: "Continue with Apple",
                    iconImage: AssetImage(Assets.assetsApple),
                    onTap: () {
                      Utils.showCustomToast(
                        "FitLifts is not currently functional for IOS",
                      );
                    },
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBottomBar(
                onPressed: () {
                  context.router.push(RegisterScreenRoute());
                },
                text1: "Don't have an account?",
                text2: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
