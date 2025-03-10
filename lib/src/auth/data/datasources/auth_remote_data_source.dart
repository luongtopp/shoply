// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shoply/core/extentions/string_extensions.dart';
import '../../../../core/common/app/cache_helper.dart';
import '../../../../core/common/models/user_model.dart';
import '../../../../core/common/singletons/cache.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/injection_container.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../../../core/utils/error_response.dart';
import '../../../../core/utils/typedefs.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> forgotPassword(String email);

  Future<void> verifyOTP({required String email, required String otp});

  Future<void> resetPassword(
      {required String email, required String newPassword});

  Future<bool> verifyToken();
}

const REGISTER_ENDPOINT = '/register';
const LOGIN_ENDPOINT = '/login';
const FORGOT_PASSWORD_ENDPOINT = '/forgot-password';
const VERIFY_OTP_ENDPOINT = '/verify-otp';
const RESET_PASSWORD_ENDPOINT = '/reset-password';
const VERIFY_TOKEN_ENDPOINT = '/verify-token';

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$FORGOT_PASSWORD_ENDPOINT');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email}),
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$LOGIN_ENDPOINT');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email, 'password': password}),
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
      await sl<CacheHelper>().cacheSessionToken(payload['accessToken']);
      final user = UserModel.fromMap(payload);
      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$REGISTER_ENDPOINT');
      final response = await _client.post(
        uri,
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }),
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }

  @override
  Future<void> resetPassword(
      {required String email, required String newPassword}) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$RESET_PASSWORD_ENDPOINT');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email, 'newPassword': newPassword}),
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }

  @override
  Future<void> verifyOTP({required String email, required String otp}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$VERIFY_OTP_ENDPOINT');
      final response = await _client.post(
        uri,
        body: {'email': email, 'otp': otp},
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }

  @override
  Future<bool> verifyToken() async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$VERIFY_TOKEN_ENDPOINT');
      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeaders,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
      return payload as bool;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It;s not your fault, it's ours",
      );
    }
  }
}
