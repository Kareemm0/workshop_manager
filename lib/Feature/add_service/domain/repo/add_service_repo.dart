import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/add_service/data/model/add_service_model.dart';

abstract class AddServiceRepo {
  Future<Either<Failure, AddServiceModel>> addSerivce(
    String id, {
    required String serviceId,
    required String time,
    required String cost,
    required String timeType,
  });

  Future<Either<Failure, String>> activeService(String id);
}
