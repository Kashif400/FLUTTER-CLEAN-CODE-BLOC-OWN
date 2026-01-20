import 'package:clean_code_architecture_app/generated/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppBar(
        backgroundColor: ColorName.background,
        elevation: 0,
        // actions: [LanguageSelector(), 24.horizontalSpace],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ashtra\n',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 33.sp,
                        color: const Color(0xFF9A9A9A),
                        fontWeight: FontWeight.w800,
                        height: 0.7,
                      ),
                    ),
                    TextSpan(
                      text: ' Ascend',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 33.sp,
                        height: 1,
                        color: ColorName.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              CustomButton(
                height: 50.h,
                fontSize: 14.sp,
                backgroundColor: ColorName.primary,
                text: localization.loginIn,
                onPressed: () {
                  // viewModel.navigateToLogin();
                },
              ),
              20.verticalSpace,
              CustomButton(
                height: 50.h,
                fontSize: 14.sp,
                backgroundColor: ColorName.darkOutlines,
                text: localization.frontDeskMode,
                onPressed: () {
                  // viewModel.navigateToTerminalSetup();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
