import 'package:flutter/material.dart';

import '../../utils/core_utils.dart';

abstract class Colours {
  // Light Theme PrimaryTint Color Swatch
  static const Color lightThemePrimaryTint = Color(0xff9e9cdc);

  // Light Theme PrimaryColor Color Swatch
  static const Color lightThemePrimaryColour = Color(0xff524eb7);

  // Light Theme Secondary Color Color Swatch
  static const Color lightThemeSecondaryColour = Color(0xfff76631);

  // light Theme PrimaryTextColor Color Swatch
  static const Color lightThemePrimaryTextColour = Color(0xff282344);

  // Light Theme Secondary TextColor Color Swatch
  static const Color lightThemeSecondaryTextColour = Color(0xff9491a1);

  // light ThemePinkColor Color Swatch
  static const Color lightThemePinkColour = Color(0xfff08e98);

  // Light ThemeWhiteColor Color Swatch
  static const Color lightThemeWhiteColour = Color(0xffffffff);

  // Light ThemeTintStockColor Color Swatch
  static const Color lightThemeTintStockColour = Color(0xfff6f6f9);

  // Light ThemeYellowColor Color Swatch
  static const Color lightThemeYellowColour = Color(0xfffec613);

  // Light ThemeStockColor Color Swatch
  static const Color lightThemeStockColour = Color(0xffe4e4e9);

  // dark Theme DarkSharpColor Color Swatch
  static const Color darkThemeDarkSharpColour = Color(0xff191821);
  // lightThemeSecondaryTextColor Color Swatch
  static const Color lightThemeSecondaryTextColor = Color(0xff9491a1);

// dark ThemeBGDark Color Swatch
  static const Color darkThemeBGDark = Color(0xff0e0d11);

// dark ThemeDarkNavBarColor Color Swatch
  static const Color darkThemeDarkNavBarColour = Color(0xff201f27);

  static Color classicAdaptiveColour(BuildContext context) =>
      CoreUtils.adaptiveColour(
        context,
        lightModeColour: lightThemePrimaryTextColour,
        darkModeColour: lightThemeWhiteColour,
      );
}
