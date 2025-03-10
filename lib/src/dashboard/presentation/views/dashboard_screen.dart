import 'package:flutter/material.dart';
import 'package:go_router/src/state.dart';

import '../../../on_boarding/utils/dashboard_ultils.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: DashboardUtils.scaffoldKey,
      body: child,
    );
  }
}
