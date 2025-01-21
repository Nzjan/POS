import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:RMS/home_layout.dart';  // Your next screen


final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});


class LoginState {
  final bool isLoading;
  final String errorMessage;
  final bool isSuccess;

  LoginState({
    required this.isLoading,
    required this.errorMessage,
    required this.isSuccess,
  });

  // Initial state
  factory LoginState.initial() {
    return LoginState(isLoading: false, errorMessage: '', isSuccess: false);
  }


  LoginState copyWith({bool? isLoading, String? errorMessage, bool? isSuccess}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState.initial());

  // Method to update state to loading, success, or error
  void setLoading() {
    state = state.copyWith(isLoading: true, errorMessage: '', isSuccess: false);
  }

  void setError(String message) {
    state = state.copyWith(isLoading: false, errorMessage: message, isSuccess: false);
  }

  void setSuccess() {
    state = state.copyWith(isLoading: false, errorMessage: '', isSuccess: true);
  }
}

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  Color _buttonColor1 = const Color(0xFFfafafa);

  void _onEnter1(PointerEvent details) {
    setState(() {
      _buttonColor1 = const Color(0xFFF8F6F6);
    });
  }

  void _onExit1(PointerEvent details) {
    setState(() {
      _buttonColor1 = const Color(0xFFfafafa);
    });
  }

  Future<void> _authenticateUser() async {
    final loginStateNotifier = ref.read(loginStateProvider.notifier);
    String email = emailController.text;
    String password = passwordController.text;

    String url = 'http://82.180.147.87:8080/api/v1/:en/login';

    final dio = Dio();

    loginStateNotifier.setLoading();

    try {
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = response.data;

        if (responseBody['success'] == true) {
           SharedPreferencesHelper().storeString("auth_token", "Bearer ${responseBody["data"]["token"]}");

          loginStateNotifier.setSuccess();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeLayout()),
          );
        } else {
          loginStateNotifier.setError('Login failed: ${responseBody['message']}');
        }
      } else {

        loginStateNotifier.setError('Failed to authenticate. Please try again.');
      }
    } on DioException catch (e) {

      loginStateNotifier.setError('Invalid Credentials');
    } catch (e) {

      loginStateNotifier.setError('An unexpected error occurred. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginStateProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Field
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 41,
                width: 316,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), // Adjusted padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF969696), width: 0.6),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: '',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              Positioned(
                top: -12,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.white,
                  child: const Text(
                    "User Name / Employee Id",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF818181),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),


          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 41,
                width: 316,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), // Adjust padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF969696), width: 0.6),
                ),
                child: Align(
                  alignment: Alignment.center, // Center the TextFormField vertically
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: const InputDecoration(
                      labelText: '',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Positioned(
                top: 2,
                right: 12,
                child: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF969696),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              Positioned(
                top: -12,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.white,
                  child: const Text(
                    "Password / Pin",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF818181),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 41,
              width: 196,
              child: MouseRegion(
                onEnter: _onEnter1,
                onExit: _onExit1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_buttonColor1),
                    foregroundColor: MaterialStateProperty.all(const Color(0xff292929)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFF292929),
                        width: 1,
                      ),
                    )),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authenticateUser(); // Call the API
                    }
                  },
                  child: loginState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Log in"),
                ),
              ),
            ),
          ),
          if (loginState.errorMessage.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              loginState.errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }
}
