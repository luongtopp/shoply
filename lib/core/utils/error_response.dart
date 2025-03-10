import 'package:equatable/equatable.dart';

import 'typedefs.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse({this.type, this.message, this.errorMessages});

  final String? type;
  final String? message;
  final List<String>? errorMessages;

  factory ErrorResponse.fromMap(DataMap map) {
    var errorMessage = (map['errors'] as List?)
        ?.cast<DataMap>()
        .map((error) => error['message'] as String)
        .toList();
    return ErrorResponse(
      type: map['type'],
      message: map['message'],
      errorMessages: errorMessage,
    );
  }

  String get errorMessage {
    var payload = '';
    if (type != null) payload = '${type!}\n';
    if (message == null) {
      payload += message!;
    } else {
      if (errorMessages == null) {
        payload += '\nWhat went wrong?';
        for (final (index, message) in errorMessages!.indexed) {
          if (index == 0) {
            payload += '\n$message';
          } else {
            payload += '\n$message';
          }
        }
      }
    }
    return payload;
  }

  @override
  List<Object?> get props => [type, message];
}
