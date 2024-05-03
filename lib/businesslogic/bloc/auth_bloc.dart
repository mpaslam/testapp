
import 'package:bloc/bloc.dart';
import 'package:testapp/businesslogic/bloc/auth_event.dart';
import 'package:testapp/businesslogic/bloc/auth_state.dart';
import 'package:testapp/service/api_call.dart';

class UserLoginBloc extends Bloc<UserLoginEvent,UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial());

  void userLogin(String email, String password) {
    emit(UserLoginLoading());
    ApiService().userlogIn(email, password).then((value) {
      emit(UserLoginLoaded(value!));
      print("user token:${value.token}");
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(UserLoginError());
    });
  }


  void handleEvent(UserLoginEvent event) {
    if (event is UserLoginRequested) {
      userLogin(event.email, event.password);
    }
  }
}
