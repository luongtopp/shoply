import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/auth/data/datasources/auth_remote_data_source.dart';
import '../../src/auth/data/repositories/auth_repository_implementation.dart';
import '../../src/auth/domain/repositories/auth_repsitory.dart';
import '../../src/auth/domain/usecases/forgot_password.dart';
import '../../src/auth/domain/usecases/login.dart';
import '../../src/auth/domain/usecases/register.dart';
import '../../src/auth/domain/usecases/reset_password.dart';
import '../../src/auth/domain/usecases/verify_otp.dart';
import '../../src/auth/domain/usecases/verify_token.dart';
import 'package:http/http.dart' as http;

import '../../src/auth/presentation/app/adapter/auth_cubit.dart';
import '../../src/user/app/adapter/auth_user_cubit.dart';
import '../../src/user/data/datasources/user_remote_data_src.dart';
import '../../src/user/data/repos/user_repo_impl.dart';
import '../../src/user/domain/repos/user_repo.dart';
import '../../src/user/domain/usercase/get_user.dart';
import '../../src/user/domain/usercase/get_user_payment.dart';
import '../../src/user/domain/usercase/update_user.dart';
import '../common/app/cache_helper.dart';
import '../common/app/providers/user_provider.dart';

part 'injection_container.main.dart';
