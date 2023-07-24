import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:subliminal/services/service_locator.dart';
import 'package:subliminal/utils/bloc.dart';

class AuthController extends Cubit<AuthState> {
  fa.FirebaseAuth fireAuth = fa.FirebaseAuth.instance;
  AuthController() : super(AuthState.initial()) {
    init();
  }

  Stream<bool> get loggedInStream =>
      seededStream.map((e) => e.loggedIn).distinct();

  void init() {
    _handleFirebaseAuthChange(fireAuth.currentUser);
    fireAuth.authStateChanges().listen(_handleFirebaseAuthChange);
  }

  void _handleFirebaseAuthChange(fa.User? user) {
    print('--- FIREBASE AUTH CHANGE ---\n$user');
    if (user == null) {
      if (state.firebaseUser != null || state.user != null) {
        emit(AuthState.initial());
      }
    } else {
      emit(AuthState(firebaseUser: user));
      _updateUser();
    }
  }

  void logOut() async {
    fireAuth.signOut();
  }

  Future<void> _updateUser() async {
    if (state.firebaseUser == null) {
      await Future.delayed(const Duration(seconds: 1));
      if (state.user != null) {
        emit(state.copyWithNull(user: true));
      }
    } else {
      final result = await api().getMe();
      if (result.ok) {
        emit(state.copyWith(user: result.object!));
      } else {
        emit(AuthState.error(result.error!));
        fireAuth.signOut();
      }
    }
  }

  Future<String?> getIdToken() async => state.getIdToken();
}

class AuthState {
  final fa.User? firebaseUser;
  final User? user;
  final String? error;

  bool get working => firebaseUser != null && user == null;
  bool get fbLoggedIn => firebaseUser != null;
  bool get loggedIn => user != null;
  bool get hasError => error != null;

  Future<String?> getIdToken() async => firebaseUser?.getIdToken();

  const AuthState({
    this.firebaseUser,
    this.user,
    this.error,
  });
  factory AuthState.initial() => const AuthState();
  factory AuthState.error(String error) => AuthState(error: error);

  AuthState copyWith({
    fa.User? firebaseUser,
    User? user,
    String? error,
  }) =>
      AuthState(
        firebaseUser: firebaseUser ?? this.firebaseUser,
        user: user ?? this.user,
        error: error ?? this.error,
      );

  AuthState copyWithNull({
    bool firebaseUser = false,
    bool user = false,
  }) =>
      AuthState(
        firebaseUser: firebaseUser ? null : this.firebaseUser,
        user: user ? null : this.user,
      );
}

class AuthProviders {
  static GoogleProvider google = GoogleProvider(
      clientId:
          '114580263138-rafeo8259a7t59d1jpv0cgfa4qndksu3.apps.googleusercontent.com');
}
