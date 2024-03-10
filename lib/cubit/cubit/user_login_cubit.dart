// import 'package:app/models/api_call.dart';
// import 'package:app/models/model.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'user_login_state.dart';

// class UserLoginCubit extends Cubit<UserLoginState> {
//   UserLoginCubit() : super(UserLoginInitial());
//   userLogin(String email, String password) {
//     emit(UserLoginLoading());
//     ApiService().userlogIn(email, password).then((value) {
//       emit(UserLoginLoaded(value!));
//       print("user token:${value.token}");
//     }).onError((error, stackTrace) {
//       print(error.toString());

//       emit(UserLoginError());
//     });
//   }
// }
