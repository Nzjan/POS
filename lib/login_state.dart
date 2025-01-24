import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

//v
class LoginState {
  final bool isLoading;
  final String errorMessage;
  final bool isSuccess;
  final String token;

  LoginState({
    required this.isLoading,
    required this.errorMessage,
    required this.isSuccess,
    required this.token,
  });

  factory LoginState.initial() {
    return LoginState(isLoading: false, errorMessage: '', isSuccess: false, token: '');
  }

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
    String? token,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      token: token ?? this.token,
    );
  }
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  final SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();

  LoginStateNotifier() : super(LoginState.initial()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    String token = await _sharedPreferencesHelper.getString('auth_token');
    if (token != 'not found') {
      state = state.copyWith(isSuccess: true, token: token);
    }
  }

  void setLoading() {
    state = state.copyWith(isLoading: true, errorMessage: '', isSuccess: false);
  }

  void setError(String message) {
    state = state.copyWith(isLoading: false, errorMessage: message, isSuccess: false);
  }

  void setSuccess(String token) {
    state = state.copyWith(isLoading: false, errorMessage: '', isSuccess: true, token: token);
  }
}
