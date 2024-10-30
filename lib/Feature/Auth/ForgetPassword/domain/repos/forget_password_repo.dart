import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String phone,
  });
}
