import "package:sembast/sembast.dart";

import '../../domain/entities/debt.dart';
import '../../domain/enums/debt_category_enum.dart';
import '../models/debt_model.dart';

abstract class DebtLocalDataSource {

  Future<List<Debt>> queryAll() {
    return null;
  }

  Future<List<Debt>> queryById(int id) {
    return null;
  }

  Future<List<Debt>> queryByMonth(int year, int month) {
    return null;
  }

  Future<List<Debt>> queryByCategory(DebtCategory category) {
    return null;
  }

  Future<List<Debt>> queryByMonthAndCategory(int year, int month, DebtCategory category) {
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
  
  Future<List<Debt>> query({ Finder finder }) async {
    final records = finder != null
      ? await this.store.find(this.database, finder: finder)
      : await this.store.find(this.database);
        return records.map<Debt>((snapshot) => DebtModel.fromJson(snapshot as Map));
  }

  @override
  Future<List<Debt>> queryAll() {
    return this.query();
  }

  @override
  Future<List<Debt>> queryById(int id) {
    return this.query( finder: Finder(
      filter: Filter.equals('id', id)
    ));
  }

  @override
  Future<List<Debt>> queryByMonth(int year, int month) {
    return this.query( finder: Finder(
      filter: Filter.and([
        Filter.equals('year', year),
        Filter.equals('month', month)
      ])
    ));
  }

  @override
  Future<List<Debt>> queryByCategory(DebtCategory category) {
    return this.query( finder: Finder(
      filter: Filter.equals('dreditCategory', category.index)
    ));
  }

  @override
  Future<List<Debt>> queryByMonthAndCategory(int year, int month, DebtCategory category) {
     return this.query( finder: Finder(
      filter: Filter.and([
        Filter.equals('year', year),
        Filter.equals('month', month),
        Filter.equals('creditCategory', category.index)
      ])
    ));
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