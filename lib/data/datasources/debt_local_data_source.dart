import "package:sembast/sembast.dart";

import '../../domain/entities/debt.dart';
import '../models/debt_model.dart';

abstract class DebtLocalDataSource {
  Future<List<Debt>> query([ int id ]) {
    return null;
  }

  Future<void> save(Debt debt) {
    return null;
  }

  Future<void> edit(Debt debt) {
    return null;
  }

  Future<void> delete(int id) {
    return null;
  }
}

class DebtLocalDataSourceImpl extends DebtLocalDataSource {
  
  final Database database;
  final StoreRef store;
  
  DebtLocalDataSourceImpl({
    this.database,
    this.store
  });
  
  @override
  Future<List<Debt>> query([ int id ]) async {
    if( id != null && id > 0 ) {
      final record = await this.store.record(id).get(this.database);
      return [ DebtModel.fromJson(record) ];
    } else {
      final records = await this.store.find(this.database);
      return records.map<Debt>((snapshot) => DebtModel.fromJson(snapshot as Map));
    }
  }

  @override
  Future<void> save(Debt debt) async {
    final json = DebtModel.toJson(debt);
    await store.add(this.database, json);
  }

  @override
  Future<List<Debt>> edit(Debt debt) async {
    final json = DebtModel.toJson(debt);
    await this.store.update(this.database, json, finder: Finder(
      filter: Filter.equals('id', debt.id)
    ));
  }

  @override
  Future<List<Debt>> delete(int id) async {
    final finder = Finder(
      filter: Filter.equals('id', id)
    );
    await store.delete(this.database, finder: finder);
  }
}