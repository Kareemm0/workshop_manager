import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/managers_account/data/model/managers_account_employer_user.dart';

abstract class ManagersAccountRepo {
  Future<Either<Failure, List<ManagersAccountEmployerUser>>> getAllEmployer();
  Future<Either<Failure, String>> deleteEmployer(String id);
  Future<Either<Failure, String>> activeEmployer(
    String id, {
    required String method,
  });
}
