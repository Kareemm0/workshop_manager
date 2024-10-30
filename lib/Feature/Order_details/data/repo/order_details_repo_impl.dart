import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/Order_details/data/models/order_details_model.dart';
import 'package:workshop_manager/Feature/Order_details/data/source/base/order_details_source.dart';
import 'package:workshop_manager/Feature/Order_details/domain/order_details_repo.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  final OrderDetailsSource source;

  OrderDetailsRepoImpl(this.source);
  @override
  Future<Either<Failure, OrderDetailsModel>> orderDetails(String id) async {
    try {
      final response = await source.orderDetails(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          OrderDetailsModel.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> cancelOrder(
    String id, {
    required String cancelOrder,
  }) async {
    try {
      final response = await source.orderDetails(id);
      if (!(response['success'] as bool)) {
        if (response.containsKey('errors')) {
          return Left(ServerFailure(
              response['errors']['cancellation_reason'][0] as String));
        }
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(OrderDetailsModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
