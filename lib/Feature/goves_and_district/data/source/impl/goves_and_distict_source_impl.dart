import 'package:workshop_manager/Core/constant/end_points.dart';
import 'package:workshop_manager/Core/network/dio/base_dio.dart';
import '../base/goves_and_distric_source.dart';

class GovesAndDistictSourceImpl implements GovesAndDistricSource {
  final BaseDio dio;

  GovesAndDistictSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> goves() async {
    try {
      final response = await dio.get(EndPoints.goves);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
