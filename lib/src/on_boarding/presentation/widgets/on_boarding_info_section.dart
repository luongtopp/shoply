import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/extentions/text_style_extensions.dart';

import '../../../../core/common/app/cache_helper.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/services/injection_container.dart';
import '../../../auth/presentation/views/login_screen.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : first = true;
  const OnBoardingInfoSection.second({super.key}) : first = false;
  final bool first;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(first ? Media.onBoardingFemale : Media.onBoardingMale),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            switch (first) {
              true => Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                      text: '${DateTime.now().year}\n',
                      style: TextStyles.headingBold.orange,
                      children: [
                        TextSpan(
                            text: 'Winter sale is live now.',
                            style: TextStyle(
                                color: Colours.classicAdaptiveColour(context)))
                      ]),
                ),
              _ => Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                      text: 'Flash Sale\n',
                      style: TextStyles.headingBold.white,
                      children: [
                        const TextSpan(
                            text: "Men's ",
                            style: TextStyle(
                              color: Colours.lightThemeSecondaryTextColour,
                            )),
                        TextSpan(
                          text: 'Shirts & Watches',
                          style: TextStyles.headingBold.white,
                        )
                      ]),
                ),
            },
            RoundedButton(
              text: 'Get Started',
              onPressed: () {
                sl<CacheHelper>().cacheFirstTimer();
                context.go(LoginScreen.path);
              },
            )
          ],
        ),
      ],
    );
  }
}
