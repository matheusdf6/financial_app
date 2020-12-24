import "package:sembast/sembast.dart";

import '../../domain/entities/credit.dart';
import '../models/credit_model.dart';

abstract class CreditLocalDataSource {
  Future<List<Credit>> query([ int id ]) {
    return null;
  }

  Future<void> save(Credit credit) {
    return null;
  }

  Future<void> edit(Credit credit) {
    return null;
  }

  Future<void> delete(int id) {
    return null;
  }
}

class CreditLocalDataSourceImpl extends CreditLocalDataSource {
  
  final Database database;
  final StoreRef store;
  
  CreditLocalDataSourceImpl({
    this.database,
    this.store
  });
  
  @override
  Future<List<Credit>> query([ int id ]) async {
    if( id != null && id > 0 ) {
      final record = await this.store.record(id).get(this.database);
      return [ CreditModel.fromJson(record) ];
    } else {
      final records = await this.store.find(this.database);
      return records.map<Credit>((snapshot) => CreditModel.fromJson(snapshot as Map));
    }
  }

  @override
  Future<void> save(Credit credit) async {
    final json = CreditModel.toJson(credit);
    await store.add(this.database, json);
  }

  @override
  Future<List<Credit>> edit(Credit credit) async {
    final json = CreditModel.toJson(credit);
    await this.store.update(this.database, json, finder: Finder(
      filter: Filter.equals('id', credit.id)
    ));
  }

  @override
  Future<List<Credit>> delete(int id) async {
    final finder = Finder(
      filter: Filter.equals('id', id)
    );
    await store.delete(this.database, finder: finder);
  }
}