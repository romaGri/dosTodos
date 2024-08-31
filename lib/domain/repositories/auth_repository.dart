abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> signIn(String username, String password);
  Future<void> singOut();
}
