import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../src/auth/presentation/app/adapter/auth_cubit.dart';
import '../../src/auth/presentation/views/login_screen.dart';
import '../../src/auth/presentation/views/splash_screen.dart';
import '../../src/dashboard/presentation/views/dashboard_screen.dart';
import '../../src/home/presentation/views/home_view.dart';
import '../../src/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../src/user/app/adapter/auth_user_cubit.dart';
import '../common/app/cache_helper.dart';
import '../common/singletons/cache.dart';
import 'injection_container.dart';

part 'router.main.dart';
