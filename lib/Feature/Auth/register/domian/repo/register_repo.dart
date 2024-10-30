import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/models/login_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, LoginModel>> register({
    required String name,
    required String phone,
    required String email,
    required String deviceName,
    required String password,
    required String confirmPassword,
    required String companyName,
    required String deviceId,
    required String deviceToken,
    required File taxImage,
    required File companyRegisteration,
  });
}
