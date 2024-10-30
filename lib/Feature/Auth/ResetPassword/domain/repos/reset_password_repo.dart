import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, String>> resetPassword({
    required String password,
    required String confirmPassowrd,
    required String uuid,
  });
}
