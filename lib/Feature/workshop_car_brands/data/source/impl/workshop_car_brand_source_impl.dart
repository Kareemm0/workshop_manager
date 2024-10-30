import 'package:workshop_manager/Core/constant/end_points.dart';
import 'package:workshop_manager/Core/network/dio/base_dio.dart';
import 'package:workshop_manager/Feature/workshop_car_brands/data/source/base/workshop_car_brand_source.dart';

class WorkshopCarBrandSourceImpl implements WorkshopCarBrandSource {
  final BaseDio dio;

  WorkshopCarBrandSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> workshopBrand() async {
    try {
      final response = await dio.get(EndPoints.brands);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
