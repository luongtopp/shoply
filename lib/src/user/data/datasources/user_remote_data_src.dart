// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../../../core/common/models/user_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../../../core/utils/error_response.dart';
import '../../../../core/utils/network_utils.dart';
import '../../../../core/utils/typedefs.dart';

abstract class UserRemoteDataSrc {
  const UserRemoteDataSrc();
  Future<UserModel> getUser(String userId);
  Future<UserModel> updateUser({
    required String userId,
    required DataMap updateData,
  });
  Future<String> getUserPaymentProfile(String userId);
}

const USERS_ENDPOINT = '/users';

class UserRemoteDataSrcImpl implements UserRemoteDataSrc {
  const UserRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId');
      final response = await _client.get(
        uri,
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
      return UserModel.fromMap(payload);
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
  Future<UserModel> updateUser({
    required String userId,
    required DataMap updateData,
  }) async {
    try {
      final uri =
          Uri.parse('${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId');
      final response = await _client.put(
        uri,
        headers: NetworkConstants.header,
        body: jsonEncode(updateData),
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
      return UserModel.fromMap(payload);
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
  Future<String> getUserPaymentProfile(String userId) async {
    try {
      final uri = Uri.parse(
          '${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId/paymentProfile');
      final response = await _client.get(
        uri,
        headers: NetworkConstants.header,
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            statusCode: response.statusCode,
            message: errorResponse.errorMessage);
      }
      return payload['url'] as String;
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
