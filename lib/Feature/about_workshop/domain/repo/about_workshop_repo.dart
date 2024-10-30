import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Feature/about_workshop/data/model/about_workshop_model.dart';
import '../../../../Core/network/error/failure.dart';

abstract class AboutWorkshopRepo {
  Future<Either<Failure, AboutWorkshopModel>> showWorkshop(String id);
}
