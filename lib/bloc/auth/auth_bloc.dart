import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthService authService = AuthService();

  AuthBloc() : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async {

      emit(AuthLoading());

      try {

        await authService.login(event.email, event.password);

        emit(AuthSuccess());

      } catch (e) {

        emit(AuthFailure(e.toString()));

      }

    });


    on<RegisterEvent>((event, emit) async {

      emit(AuthLoading());

      try {

        await authService.signUp(event.email, event.password);

        emit(AuthSuccess());

      } catch (e) {

        emit(AuthFailure(e.toString()));

      }

    });


    on<LogoutEvent>((event, emit) async {

      await authService.logout();

      emit(AuthInitial());

    });

  }
}