import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/workshop_orders/data/model/workshop_order_model.dart';

abstract class WorkshopOrderRepo {
  Future<Either<Failure, List<WorkshopOrderModel>>> getWorkshopOrders(String id );
}
