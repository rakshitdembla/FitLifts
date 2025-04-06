part of "update_profile_imports.dart";

@RoutePage()
class UpdateProfilePage extends StatefulWidget {
  final String? previousName;
  final double? previousBodyWeight;
  const UpdateProfilePage({
    super.key,
    required this.previousBodyWeight,
    required this.previousName,
  });

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  FocusNode nameNode = FocusNode();
  TextEditingController nameController = TextEditingController();

  FocusNode weightNode = FocusNode();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.previousName.toString();
    weightController.text = widget.previousBodyWeight.toString();
    super.initState();
  }

  @override
  void dispose() {
    nameNode.dispose();
    weightNode.dispose();
    nameController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 20.sp,
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        scrolledUnderElevation: 0.0,
        backgroundColor: MyColors.primaryCharcoal,
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, state, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      state.pickImage(context);
                    },
                    child: CircleAvatar(
                      radius: 60.r,
                      child:
                          state.profileImage != null &&
                                  state.profileImage!.isNotEmpty
                              ? ClipOval(
                                child: Image.network(
                                  state.profileImage!,
                                  fit: BoxFit.cover,
                                  width: 120.w,
                                  height: 120.h,
                                ),
                              )
                              : 
                              state.initialImage != null
                                          ? Image.file(
                                            state.initialImage!,
                                            fit: BoxFit.cover,
                                            width: 70.w,
                                            height: 70.h,
                                          )
                             : Icon(Icons.person, size: 60.r),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CredentialsField(
                    label: "Name",
                    focusNode: nameNode,
                    hinttext: "Your Name",
                    maxLength: 50,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(weightNode);
                    },
                    prefixIcon: Icon(Icons.person),
                    isPassword: false,
                    controller: nameController,
                  ),
                  SizedBox(height: 20.h),
                  CredentialsField(
                    label: "Body Weight",
                    focusNode: weightNode,
                    hinttext: "Current Body Weight",
                    maxLength: 5,
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    prefixIcon: Icon(Icons.scale),
                    isPassword: false,
                    controller: weightController,
                  ),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Consumer<SettingsProvider>(
        builder: (context, state, child) {
          return state.isUpdatingProfile
              ? Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                  top: 10.h,
                ),
                child: CircularProgressLoading(),
              )
              : Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
                  top: 10.h,
                ),
                child: ElevatedCTA(
                  onPressed: () {
                    state.updateProfileDetails(
                      context,
                      nameController.text,
                      weightController.text,
                      nameController,
                      weightController,
                    );
                  },
                  title: "Update",
                ),
              );
        },
      ),
    );
  }
}
