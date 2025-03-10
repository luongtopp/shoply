import 'package:flutter/material.dart';

import '../../../../core/common/widgets/app_bar_bottom.dart';
import '../../../../core/res/styles/text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign In',
            style: TextStyles.hedingSemiBold,
          ),
          bottom: const AppBarBottom(),
        ),
        body: const Placeholder());
  }
}
