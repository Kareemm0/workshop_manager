import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Feature/workshop_services/data/model/workshop_list_service.dart';

import '../../../../Core/network/error/failure.dart';

abstract class WorkshopListServiceRepo {
  Future<Either<Failure, List<WorkshopListService>>> workshopservice();
}
