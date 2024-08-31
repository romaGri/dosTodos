import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
  error,
}

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? errorMessage;

  AuthState({required this.authStatus, this.user, this.errorMessage});

  factory AuthState.initial() => AuthState(authStatus: AuthStatus.initial);

  factory AuthState.authenticated(User user) =>
      AuthState(authStatus: AuthStatus.authenticated, user: user);

  factory AuthState.unauthenticated() =>
      AuthState(authStatus: AuthStatus.unauthenticated);

  factory AuthState.error(String message) =>
      AuthState(authStatus: AuthStatus.error, errorMessage: message);
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthNotifier({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthState.initial()) {
    _checkInitialState();
  }

  Future<void> _checkInitialState() async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      state = AuthState.authenticated(user);
    } else {
      state = AuthState.unauthenticated();
    }
  }
}
