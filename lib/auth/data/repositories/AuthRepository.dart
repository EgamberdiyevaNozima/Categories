import '../../../core/client.dart';
import '../../../core/secure_storage.dart';
import '../models/user_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<void> login(String login, String password) async {
    final String token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login, password);
    await SecureStorage.saveToken(token);
  }

  Future<void> register(UserModel user) async {
    await client.register(user);
  }
}
