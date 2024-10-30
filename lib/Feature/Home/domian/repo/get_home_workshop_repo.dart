import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/Home/data/model/home_workshop_model.dart';

abstract class GetHomeWorkshopsRepo {
  Future<Either<Failure, List<HomeWorkshopModel>>> getHomeWorkshops();
  Future<Either<Failure, String>> deleteWorkshop(String id);
}
