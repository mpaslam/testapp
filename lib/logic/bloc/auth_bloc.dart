
import 'package:app/logic/bloc/auth_event.dart';
import 'package:app/logic/bloc/auth_state.dart';
import 'package:app/models/api_call.dart';
import 'package:bloc/bloc.dart';


class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

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

  // Add this method to handle events
  void handleEvent(UserLoginEvent event) {
    if (event is UserLoginRequested) {
      userLogin(event.email, event.password);
    }
  }
}