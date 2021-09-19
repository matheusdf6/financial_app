import 'package:financial_app/core/errors/failures.dart';
import 'package:financial_app/core/usecase/usecase.dart';
import "package:financial_app/domain/usecases/user/get_user.dart";
import "package:financial_app/domain/usecases/user/save_user.dart";
import 'package:financial_app/domain/entities/user.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  _UserStoreBase({this.getUser, this.saveUser});

  GetUser getUser;
  SaveUser saveUser;

  @observable
  User user;

  @observable
  String failureMessage;

  @action
  Future<void> getCurrentUser() async {
    final result = await getUser(NoParams());
    result.fold(
        (failure) => failureMessage =
            'Não foi possível carregar as informações do usuário',
        (loadedUser) => user = loadedUser);
  }
}
