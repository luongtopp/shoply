import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/app/cache_helper.dart';
import '../../../../core/common/singletons/cache.dart';
import '../../../../core/common/widgets/ecomly_logo.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/services/injection_container.dart';
import '../../../user/app/adapter/auth_user_cubit.dart';
import '../app/adapter/auth_cubit.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> redirectToIndex() async {
    final router = GoRouter.of(context);
    await sl<CacheHelper>().resetSession();
    router.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthUserCubit, AuthUserState>(
      listener: (BuildContext context, state) async {
        if (state is AuthUserError) {
          await redirectToIndex();
        } else if (state is FetchedUser) {
          context.go('/', extra: 'home');
        }
      },
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is TokenVerified) {
            if (state.isValid) {
              context.read<AuthUserCubit>().getUserById(Cache.instance.userId!);
            } else {
              final router = GoRouter.of(context);
              await sl<CacheHelper>().resetSession();
              router.go('/');
            }
          } else if (state is AuthError) {
            await redirectToIndex();
          }
        },
        child: const Scaffold(
            backgroundColor: Colours.lightThemePrimaryColour,
            body: Center(
              child: EcomlyLogo(),
            )),
      ),
    );
  }
}
