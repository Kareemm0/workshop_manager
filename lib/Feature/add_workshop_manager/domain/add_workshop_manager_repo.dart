import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/add_workshop_manager/data/model/add_workshop_manager_model.dart';

abstract class AddWorkshopManagerRepo {
  Future<Either<Failure, AddWorkshopManagerModel>> addWorkshopManager({
    required String jobTitle,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required List workshopsId,
  });
}
