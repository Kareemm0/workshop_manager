import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/show_manager_account/data/model/show_manager_info_model.dart';

abstract class ShowManagerRepo {
  Future<Either<Failure, ShowManagerInfoModel>> showManager(String id);
  Future<Either<Failure, ShowManagerInfoModel>> updateManger(
    String id, {
    required String name,
    required String email,
    required String phone,
    required List workshopsId,
    required String password,
    required String confirmPassword,
    required String jobTitle,
    required String method,
  });
}
