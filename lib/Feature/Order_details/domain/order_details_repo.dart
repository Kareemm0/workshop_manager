import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Feature/Order_details/data/models/order_details_model.dart';

import '../../../Core/network/error/failure.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, OrderDetailsModel>> orderDetails(String id);
  Future<Either<Failure, OrderDetailsModel>> cancelOrder(
    String id, {
    required String cancelOrder,
  });
}
