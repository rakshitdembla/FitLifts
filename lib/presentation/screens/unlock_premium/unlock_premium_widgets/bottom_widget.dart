import 'package:fitlifts/presentation/utils.dart';
import 'package:fitlifts/services/providers/user_initial_details_provider.dart';
import 'package:fitlifts/presentation/screens/unlock_premium/unlock_premium_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../common_widgets/elevated_cta.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Limited-Time Offer",
            style: TextStyle(
              color: MyColors.whiteText,

              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Pay once, enjoy forever! Only ₹199 for lifetime access.",
            style: TextStyle(
              color: MyColors.greyText,

              fontWeight: FontWeight.w900,
              fontSize: 15.sp,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Consumer<UnlockPremiumProvider>(
              builder: (context, state, child) {
                return ElevatedCTA(
                  title: "Upgrade Now",
                  onPressed: () {
                    Provider.of<UserInitialDetailsProvider>(
                          context,
                          listen: false,
                        ).isUserPremium
                        ? Utils.showCustomToast(
                          "You already have access to premium features!",
                        )
                        : state.startPayment(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
