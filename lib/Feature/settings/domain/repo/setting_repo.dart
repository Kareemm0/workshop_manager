import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';

abstract class SettingRepo {
  Future<Either<Failure, String>> logout();
}
