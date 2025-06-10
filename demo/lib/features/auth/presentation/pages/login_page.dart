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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ShoeBloc(),
                child: MainView(),
              ),
            ),
          );
        } else if (state is FailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _usernameController,
                cursorColor: Color.fromRGBO(255, 107, 53, 1),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 107, 53, 1),
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
                controller: _passwordController,
                cursorColor: Color.fromRGBO(255, 107, 53, 1),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 107, 53, 1),
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
                      _isVisible ? Icons.visibility : Icons.visibility_off,
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
                      color: Color.fromRGBO(255, 107, 53, 1),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(255, 107, 53, 1),
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
    );
  }
}
