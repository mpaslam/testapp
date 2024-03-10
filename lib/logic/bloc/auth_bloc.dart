// // auth_bloc.dart

// import 'dart:async';
// import 'dart:ffi';
// import 'package:app/logic/bloc/auth_event.dart';
// import 'package:app/logic/bloc/auth_state.dart';
// import 'package:app/models/model.dart';
// import 'package:bloc/bloc.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<Authinitialevent>(Authinitialevent());
//     on<LoginEvent>(LoginEvent());
//   }

//   FutureOr<Void> Authinitial(
//       Authinitialevent event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     await Future.delayed(Duration(seconds: 3));
//     emit(AuthSucsess(sucsess:HomePageModel.us

//     ))

//   }

//   // late HomePageModel data;
//   // final HomePageRepository homePageRepo;

//   // AuthBloc(this.homePageRepo) : super(AuthInitialState());

//   @override
//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     if (event is LoginEvent) {
//       yield AuthLoadingState();
//       try {
//         data = await homePageRepo.fetchDetails(event.email, event.password);
//         // Add logic to handle successful login
//         // For example, you can emit a state indicating success
//         // or navigate to the home page.
//       } catch (error) {
//         // Handle login error, for example, emit AuthErrorState
//         yield AuthErrorState();
//       }
//     }
//   }
// }
import 'package:app/logic/bloc/auth_event.dart';
import 'package:app/logic/bloc/auth_state.dart';
import 'package:app/models/api_call.dart';
import 'package:bloc/bloc.dart';
// Import the events file

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