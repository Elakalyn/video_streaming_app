// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';

var formKey = GlobalKey<FormState>();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var usernameController = TextEditingController();
var confirmPasswordController = TextEditingController();

Widget buttonLoad = createAccountButton(
    formKey: formKey,
    emailController: emailController,
    usernameController: usernameController,
    passwordController: passwordController);

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          context.goNamed('home');
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey[900],
            body: SafeArea(
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
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
                                  Icons.person,
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
                                alignment: Alignment.center,
                                width: 80,
                                height: 80,
                                child: Center(child: Logo()),
                              ),
                            ],
                          ),
                          40.h,
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(children: [
                                TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Username cannot be left empty.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    prefixIcon: const Icon(
                                      Icons.person,
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
                                20.h,
                                TextFormField(
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
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
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
                                20.h,
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
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        cubit.changeViewable();
                                      },
                                      child: const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                20.h,
                                TextFormField(
                                  controller: confirmPasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field cannnot be left empty.';
                                    }
                                    if (value.toString() !=
                                        passwordController.text) {
                                      return 'Please recheck your password before proceeding.';
                                    }
                                    return null;
                                  },
                                  obscureText: cubit.isViewable,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        cubit.changeViewable();
                                      },
                                      child: const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                50.h,
                                buttonLoad
                              ]))
                        ]),
                  ),
                ),
              ),
            ));
      },
    );
  }
}

class createAccountButton extends StatelessWidget {
  const createAccountButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LoadingRegisterState) {
          return CircularProgressIndicator();
        } else {
          return ElevatedButton(
            onPressed: () {
              UserCubit.get(context).register(
                email: emailController.text,
                password: passwordController.text,
                name: usernameController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            child: Text(
              'CREATE YOUR ACCOUNT',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            ),
          );
        }
      },
    );
  }
}
