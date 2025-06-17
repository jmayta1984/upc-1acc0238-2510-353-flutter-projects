import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/app/presentation/pages/main_view.dart';
import 'package:demo/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demo/features/auth/presentation/blocs/auth_event.dart';
import 'package:demo/features/auth/presentation/blocs/auth_state.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainView(),
            ),
          );
        } else if (state is FailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = (state is LoadingAuthState);
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isLoading ? Colors.grey.shade100 : Colors.transparent,
                ),
                child: AbsorbPointer(
                  absorbing: isLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autocorrect: false,
                          controller: _usernameController,
                          cursorColor: ColorPalette.primaryColor,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorPalette.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            hintText: "Username",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autocorrect: false,
                          controller: _passwordController,
                          cursorColor: ColorPalette.primaryColor,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorPalette.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => {
                                setState(() {
                                  _isVisible = !_isVisible;
                                }),
                              },
                              icon: Icon(
                                _isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Password",
                          ),
                          obscureText: !_isVisible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 1.0,
                                color: ColorPalette.primaryColor,
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: ColorPalette.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(32),
                              ),
                            ),
                            onPressed: () => {
                              context.read<AuthBloc>().add(
                                LoginEvent(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            },
                            child: Text("Sign in"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
