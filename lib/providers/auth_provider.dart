import 'package:flutter/foundation.dart';
import 'package:tim_ve_ui/data/mock/mock_data.dart';
import 'package:tim_ve_ui/data/models/models.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;
  AppUser? _user;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  AppUser? get user => _user;

  Future<void> loginWithEmail() async {
    _isLoading = true;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 800));
    _isAuthenticated = true;
    _user = MockData.demoUser;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _isAuthenticated = true;
    _user = MockData.demoUser;
    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _user = null;
    notifyListeners();
  }
}
