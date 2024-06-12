import 'package:equatable/equatable.dart';

import '../../Constants/Constants.dart';

///AuthResult is a representation of Authendication results, that is very handly and clean code,
///this helps to avoid [String] representation of [Errors], [Exceptions], [Successful] function callbacks
class AuthResult extends Equatable {
  ///Type of result
  final bool isSuccess;

  ///Messages of the result, that may be an error or success in a readable
  final String? message;

  ///Constructor
  const AuthResult({
    this.isSuccess = false,
    this.message,
  });

  ///Creates a new [Result] data from current [AuthResult] data
  AuthResult copyWith({bool? isSuccess, String? message}) {
    return AuthResult(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }

  ///[Json] representation of the current [AuthResult]
  Json get toJson => <String, dynamic>{
        'isSuccess': isSuccess,
        'message': message,
      };

  ///To quick check for failiures
  bool get isFailed => !isSuccess;

  ///Quick sucess result
  static const AuthResult sucess = AuthResult(isSuccess: true, message: 'Sucess!');

  ///Quick failed result
  static const AuthResult failed = AuthResult(message: 'Failed to process!');

  @override
  List<Object?> get props => <Object?>[isSuccess, message];
}
