import 'package:financial_app/data/models/plan_model.dart';
import 'package:financial_app/domain/entities/plan.dart';
import "package:sembast/sembast.dart";

abstract class PlanLocalDataSource {
  Future<List<Plan>> query([int id]) {
    return null;
  }

  Future<void> save(Plan plan) {
    return null;
  }

  Future<void> edit(Plan plan) {
    return null;
  }

  Future<void> delete(int id) {
    return null;
  }
}

class PlanLocalDataSourceImpl extends PlanLocalDataSource {
  
  final Database database;
  final StoreRef store;
  
  PlanLocalDataSourceImpl({
    this.database,
    this.store
  });
  
  @override
  Future<List<Plan>> query([ int id ]) async {
    if( id != null && id > 0 ) {
      final record = await this.store.record(id).get(this.database);
      return [ PlanModel.fromJson(record) ];
    } else {
      final records = await this.store.find(this.database);
      return records.map<Plan>((snapshot) => PlanModel.fromJson(snapshot as Map));
    }
  }

  @override
  Future<void> save(Plan plan) async {
    final json = PlanModel.toJson(plan);
    await store.add(this.database, json);
  }

  @override
  Future<List<Plan>> edit(Plan plan) async {
    final json = PlanModel.toJson(plan);
    await this.store.update(this.database, json, finder: Finder(
      filter: Filter.equals('id', plan.id)
    ));
  }

  @override
  Future<List<Plan>> delete(int id) async {
    final finder = Finder(
      filter: Filter.equals('id', id)
    );
    await store.delete(this.database, finder: finder);
  }
}