import 'package:swdprojectbackup/di.dart';
import 'package:swdprojectbackup/domain/login.dart';

class LoginViewModel {
  LoginUsecase _loginUsecase = AppManager.instance().loginUsecase();

  void login(String email, String pass, Function onSuccess, Function onError) {
    _loginUsecase.login(email, pass, onSuccess, onError);
  }

}
