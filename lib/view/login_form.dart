import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:RMS/view/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      _buttonColor1 = const Color(0xFFAD6FE0);
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
                height: 41.h,
                width: 316.w,
                padding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h), // Adjusted padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
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

                ),
              ),
              Positioned(
                top: -12.h,
                left: 16.w,
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  color: Colors.white,
                  child:  Text(
                    "User Name / Employee Id",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF818181),
                    ),
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 32.h),


          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 41.h,
                width: 316.w,
                padding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h), // Adjust padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
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
                  ),
                ),
              ),
              Positioned(
                top: 2.h,
                right: 12.w,
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
                top: -12.h,
                left: 16.w,
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  color: Colors.white,
                  child:  Text(
                    "Password / Pin",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF818181),
                    ),
                  ),
                ),
              ),
            ],
          ),

           SizedBox(height: 45.h),
          Center(
            child: SizedBox(
              height: 41.h,
              width: 196.w,
              child: MouseRegion(
                onEnter: _onEnter1,
                onExit: _onExit1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(_buttonColor1),
                    foregroundColor: WidgetStateProperty.all(const Color(0xff292929)),
                    padding: WidgetStateProperty.all( EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:  BorderSide(
                        color: Color(0xFF292929),
                        width: 1.w,
                      ),
                    )),
                    textStyle: WidgetStateProperty.all( TextStyle(
                      fontSize: 14.sp,
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
             SizedBox(height: 20.h),
            Text(
              loginState.errorMessage,
              style:  TextStyle(color: Colors.red, fontSize: 16.sp),
            ),
          ],
        ],
      ),
    );
  }
}
