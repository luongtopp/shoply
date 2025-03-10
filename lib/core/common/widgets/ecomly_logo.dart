import 'package:flutter/material.dart';
import 'package:shoply/core/extentions/text_style_extensions.dart';

import '../../res/styles/colors.dart';
import '../../res/styles/text.dart';

class EcomlyLogo extends StatelessWidget {
  const EcomlyLogo({super.key, this.style});
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Ecom',
        style: style ?? TextStyles.appLogo.white,
        children: const [
          TextSpan(
            text: 'ly',
            style: TextStyle(
              color: Colours.lightThemeSecondaryColour,
            ),
          )
        ],
      ),
    );
  }
}
