import 'package:equatable/equatable.dart';

import 'exception.dart';

sealed class Failure extends Equatable {
  const Failure({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [statusCode, message];
}

class ServiceFailure extends Failure {
  const ServiceFailure({required super.statusCode, required super.message});

  ServiceFailure.fromException(ServerException e)
      : this(statusCode: e.statusCode, message: e.message);
}

class ServerFailure extends Failure {
  const ServerFailure({required super.statusCode, required super.message});

  ServerFailure.fromException(ServerException e)
      : this(statusCode: e.statusCode, message: e.message);
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message}) : super(statusCode: 3);

  CacheFailure.fromException(ServerException e) : this(message: e.message);
}
