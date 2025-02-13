// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool fieldStatus = true;
    Widget suffixWidgetPassword = const Icon(
      Icons.visibility,
      color: Colors.white,
    );
    Widget? suffixWidgetEmail = null;
    var cubit = UserCubit.get(context);

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        print(state);
        if (state is LoadingLoginState) {
          fieldStatus = false;
          suffixWidgetEmail = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
          suffixWidgetPassword = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
        } else {
          fieldStatus = true;
          suffixWidgetEmail = null;
          suffixWidgetPassword = const Icon(
            Icons.visibility,
            color: Colors.white,
          );
        }

        if (state is SuccessLoginState) {
          context.goNamed('home');
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey[900],
                            size: 40.0,
                          ),
                        ),
                        20.w,
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 80,
                          height: 80,
                          child: Center(child: Logo()),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-mail cannot be left empty.';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: suffixWidgetEmail,
                              enabled: fieldStatus,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be left empty.';
                              }
                              return null;
                            },
                            obscureText: cubit.isViewable,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              enabled: fieldStatus,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  cubit.changeViewable();
                                },
                                child: suffixWidgetPassword,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  'REGISTER NOW',
                                ),
                                onPressed: () {
                                  context.goNamed('register');
                                },
                              ),
                            ],
                          ),
                        ]))
                  ]),
            ));
      },
    );
  }
}
