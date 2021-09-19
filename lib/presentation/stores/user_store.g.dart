// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  final _$userAtom = Atom(name: '_UserStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$failureMessageAtom = Atom(name: '_UserStoreBase.failureMessage');

  @override
  String get failureMessage {
    _$failureMessageAtom.reportRead();
    return super.failureMessage;
  }

  @override
  set failureMessage(String value) {
    _$failureMessageAtom.reportWrite(value, super.failureMessage, () {
      super.failureMessage = value;
    });
  }

  final _$getCurrentUserAsyncAction =
      AsyncAction('_UserStoreBase.getCurrentUser');

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
failureMessage: ${failureMessage}
    ''';
  }
}
