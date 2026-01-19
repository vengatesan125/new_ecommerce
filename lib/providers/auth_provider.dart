import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isAuthenticated = false;

  User? get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      _user = User(
        id: userId,
        name: prefs.getString('userName') ?? '',
        email: prefs.getString('userEmail') ?? '',
        phone: prefs.getString('userPhone') ?? '',
      );
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isNotEmpty && password.isNotEmpty) {
      _user = User(
        id: '1',
        name: 'Demo User',
        email: email,
        phone: '9876543210',
      );
      _isAuthenticated = true;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', _user!.id);
      await prefs.setString('userName', _user!.name);
      await prefs.setString('userEmail', _user!.email);
      await prefs.setString('userPhone', _user!.phone);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signup(String name, String email, String phone, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty && password.isNotEmpty) {
      _user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        phone: phone,
      );
      _isAuthenticated = true;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', _user!.id);
      await prefs.setString('userName', _user!.name);
      await prefs.setString('userEmail', _user!.email);
      await prefs.setString('userPhone', _user!.phone);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _user = null;
    _isAuthenticated = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    notifyListeners();
  }

  Future<bool> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
