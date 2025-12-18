import 'package:khatoon_container/features/livestock/domain/entities/livestock.dart';

abstract class ILivestockRepository {
  Future<List<LivestockSummary>> getAll();
  Future<LivestockSummary> create(LivestockSummary cow);
  Future<void> delete(LivestockSummary cow);
  Future<void> update(LivestockSummary cow);
// update, delete, ...
}