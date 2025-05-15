part of "register_imports.dart";

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();
  FocusNode cPassNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    cPassController.dispose();
    emailNode.dispose();
    passNode.dispose();
    cPassNode.dispose();
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
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: MyColors.whiteText),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitle(h1: "Register", h2: "Your Fitness Begins Here!"),
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
                  FocusScope.of(context).requestFocus(cPassNode);
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
              SizedBox(height: 15.h),
              CredentialsField(
                controller: cPassController,
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                label: "Confirm Password",
                focusNode: cPassNode,
                hinttext: "••••••••••",
                maxLength: 52,
                prefixIcon: Icon(Icons.password, color: MyColors.greyText),
                isPassword: true,
              ),

              SizedBox(height: 25.h),

              Consumer<RegisterProvider>(
                builder: (context, registerProvider, child) {
                  return registerProvider.isLoading
                      ? CircularProgressLoading()
                      : ElevatedCTA(
                        title: "Sign Up",
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          registerProvider.registerWithEmailPassword(
                            emailController.text.toLowerCase().trim(),
                            passController.text,
                            cPassController.text,
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
                          FocusScope.of(context).unfocus();
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
                        "FitLifts is not currently functional of IOS",
                      );
                    },
                  )
                  : SizedBox.shrink(),
                  AgreeToConditions()
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
                  FocusScope.of(context).unfocus();
                  context.router.pop();
                },
                text1: "Already have an account?",
                text2: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
