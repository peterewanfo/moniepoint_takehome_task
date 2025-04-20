import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/custom_colors.dart';
import '../../../styles/custom_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.bacgroundWhite2,
            CustomColors.backgroundPrimary.withOpacity(0.3),
          ],
          stops: const [0.3, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hey, Marina",
            style: CustomStyle.textStyleBody.copyWith(
              fontWeight: FontWeight.w400,
              color: CustomColors.textPrimary,
              fontSize: 30.sp,
              height: 1.2,
            ),
          )
              .animate(
                delay: const Duration(milliseconds: 300),
              )
              .slideY(
                begin: 1,
                end: 0,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 700),
              )
              .fadeIn(
                duration: const Duration(seconds: 1),
              ),
        ],
      ),
    );
  }
}
