import 'package:dio/dio.dart';
import 'package:khatoon_container/core/api/data/datasources/api_service.dart';
import 'package:khatoon_container/core/api/domain/repositories/i_livestock_repository.dart';
import 'package:khatoon_container/features/livestock/domain/entities/livestock.dart';

class LivestockRepository implements ILivestockRepository {
  final ApiService apiService = ApiService();

  @override
  Future<List<LivestockSummary>> getAll() async {
    try {
      final response = await apiService.dio.get('/cows');
      final List data = response.data['data'] ?? response.data;
      return data.map((json) => LivestockSummary.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'خطا در دریافت گاوها');
    }
  }

  @override
  Future<LivestockSummary> create(LivestockSummary cow) async {
    try {
      final response = await apiService.dio.post('/cows', data: cow.toJson());
      return LivestockSummary.fromJson(response.data['data'] ?? response.data);
    } on DioException catch (e) {
      throw Exception(e.message ?? 'خطا در ثبت گاو');
    }
  }

  @override
  Future<void> delete(LivestockSummary cow) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(LivestockSummary cow) {
    // TODO: implement update
    throw UnimplementedError();
  }
}