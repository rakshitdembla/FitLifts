import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_assets.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/common_widgets/divider_text.dart';
import 'package:fitlifts/presentation/routes/auto_router.gr.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/auth_bottom_bar.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/auth_title.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/credentials_text_field.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/social_login_button.dart';
import 'package:fitlifts/presentation/screens/auth/login/login_provider.dart';
import 'package:fitlifts/presentation/screens/auth/providers/social_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/elevated_cta.dart';

part "login.dart";
