import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';

abstract class WorkshopCarBrandRepo {
  Future<Either<Failure, List<WorkshopCarBrand>>> workshopBrand();
}
