import "package:sembast/sembast.dart";

import '../../domain/entities/credit.dart';
import '../../domain/enums/credit_category_enum.dart';
import '../models/credit_model.dart';

abstract class CreditLocalDataSource {

  Future<List<Credit>> queryAll() {
    return null;
  }

  Future<List<Credit>> queryById(int id) {
    return null;
  }

  Future<List<Credit>> queryByMonth(int year, int month) {
    return null;
  }

  Future<List<Credit>> queryByCategory(CreditCategory category) {
    return null;
  }

  Future<List<Credit>> queryByMonthAndCategory(int year, int month, CreditCategory category) {
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

  Future<List<Credit>> query({ Finder finder }) async {
    final records = finder != null
      ? await this.store.find(this.database, finder: finder)
      : await this.store.find(this.database);
        return records.map<Credit>((snapshot) => CreditModel.fromJson(snapshot as Map));
  }

  @override
  Future<List<Credit>> queryAll() {
    return this.query();
  }

  @override
  Future<List<Credit>> queryById(int id) {
    return this.query( finder: Finder(
      filter: Filter.equals('id', id)
    ));
  }

  @override
  Future<List<Credit>> queryByMonth(int year, int month) {
    return this.query( finder: Finder(
      filter: Filter.and([
        Filter.equals('year', year),
        Filter.equals('month', month)
      ])
    ));
  }

  @override
  Future<List<Credit>> queryByCategory(CreditCategory category) {
    return this.query( finder: Finder(
      filter: Filter.equals('creditCategory', category.index)
    ));
  }

  @override
  Future<List<Credit>> queryByMonthAndCategory(int year, int month, CreditCategory category) {
     return this.query( finder: Finder(
      filter: Filter.and([
        Filter.equals('year', year),
        Filter.equals('month', month),
        Filter.equals('creditCategory', category.index)
      ])
    ));
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