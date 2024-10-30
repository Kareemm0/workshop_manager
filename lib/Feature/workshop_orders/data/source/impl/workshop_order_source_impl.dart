import 'package:workshop_manager/Core/constant/end_points.dart';
import 'package:workshop_manager/Core/network/dio/base_dio.dart';
import 'package:workshop_manager/Feature/workshop_orders/data/source/base/workshop_order_source.dart';

class WorkshopOrderSourceImpl implements WorkshopOrderSource {
  final BaseDio dio;

  WorkshopOrderSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> getWorkshopOrders(String id) async {
    try {
      final response = await dio.get(EndPoints.orders(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
