import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoply/core/services/injection_container.dart';

import 'core/res/styles/colors.dart';
import 'core/services/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the theme mode
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colours.classicAdaptiveColour(context) ==
                  Colours.lightThemePrimaryTextColour
              ? Colours.lightThemePrimaryColour
              : Colours.darkThemeDarkNavBarColour,
          systemNavigationBarIconBrightness:
              Colours.classicAdaptiveColour(context) ==
                      Colours.lightThemePrimaryTextColour
                  ? Brightness.dark
                  : Brightness.light,
        ),
      );
    });

    final theme = ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Colours.lightThemePrimaryColour),
      fontFamily: 'Switzer',
      appBarTheme: const AppBarTheme(
          backgroundColor: Colours.lightThemeTintStockColour,
          foregroundColor: Colours.lightThemePrimaryTextColour),
      useMaterial3: true,
    );

    return MaterialApp.router(
      title: 'Ecomly',
      routerConfig: router,
      theme: theme,
      darkTheme: theme.copyWith(
        scaffoldBackgroundColor: Colours.darkThemeBGDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colours.darkThemeBGDark,
          foregroundColor: Colours.lightThemeWhiteColour,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

//  home: Scaffold(
//         body: Center(
//           child: Text(
//             'Hello World!',
//             style: TextStyles.headingRegular
//                 .copyWith(color: Colours.classicAdaptiveColour(context)),
//           ),
//         ),
//       ),
