import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musync/core/common/custom_snackbar.dart';
import 'package:musync/core/common/formfiled.dart';
import 'package:musync/core/constants.dart';
import 'package:musync/core/routers.dart';
import 'package:musync/features/authentication/bloc/authentication_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: "aayushpandey616@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "VerySecretPassword@100");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Size mediaQuerySize = MediaQuery.of(context).size;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          kShowSnackBar("Login Successful", context: context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeRoute,
            (route) => false,
          );
        }
        if (state is AuthenticationError) {
          kShowSnackBar(state.message, context: context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isDark ? KColors.blackColor : KColors.whiteColor,
        appBar: AppBar(
          backgroundColor: isDark ? KColors.blackColor : KColors.whiteColor,
          scrolledUnderElevation: 0,
          elevation: 0,
          toolbarHeight: 100,
          // Back Button
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.getStartedRoute);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: isDark ? KColors.whiteColor : KColors.blackColor,
            ),
          ),
          actions: [
            // Register Button
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.signupRoute,
                  (route) => false,
                );
              },
              child: Text(
                'Register',
                style: GlobalConstants.textStyle(
                  fontSize: 18,
                  color: isDark ? KColors.whiteColor : KColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics:
                      constraints.maxHeight < MediaQuery.of(context).size.height
                          ? null
                          : const NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Login Texts
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 80,
                            maxWidth: mediaQuerySize.width,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Login Text
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Log In',
                                  style: GlobalConstants.textStyle(
                                    color: isDark
                                        ? KColors.whiteColor
                                        : KColors.blackColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              // Welcome back Text
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Welcome back, we missed you',
                                  style: GlobalConstants.textStyle(
                                    color: isDark
                                        ? KColors.whiteColor
                                        : KColors.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Login Form
                        Container(
                          height: mediaQuerySize.height * 0.5,
                          width: mediaQuerySize.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: isDark
                                ? KColors.whiteColor
                                : KColors.blackColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: LoginForm(
                            formKey: formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            onPressed: () {
                              context.read<AuthenticationBloc>().add(
                                    LoginEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              child: Center(
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const Positioned.fill(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super();

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Email Text Form Field
          CTextFormFiled(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            labelText: 'Email',
            fillColor: isDark ? KColors.blackColor : KColors.offWhiteColor,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Email is required';
              } else if (!RegExp(
                r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$',
              ).hasMatch(p0)) {
                return 'Email is invalid';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          // Password Text Form Field
          CPasswordFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            labelText: 'Password',
            fillColor: isDark ? KColors.blackColor : KColors.offWhiteColor,
            obscureText: true,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Password is required';
              } else if (p0.length < 8) {
                return 'Password must be at least 8 characters';
              } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(p0)) {
                return 'Password must contain at least one uppercase letter';
              } else if (!RegExp(r'^(?=.*?[a-z])').hasMatch(p0)) {
                return 'Password must contain at least one lowercase letter';
              } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(p0)) {
                return 'Password must contain at least one number';
              } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(p0)) {
                return 'Password must contain at least one special character';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          // Forgot Password Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.forgotPasswordRoute,
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: GlobalConstants.textStyle(
                    color: isDark ? KColors.offBlackColor : KColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Login Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: KColors.accentColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(
                MediaQuery.of(context).size.width,
                50,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                onPressed();
              }
            },
            child: Text(
              'LOGIN',
              style: GlobalConstants.textStyle(
                color: KColors.whiteColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Terms and Conditions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "By continuing, you’re agreeing to Musync Privacy policy and Terms of use.",
              textAlign: TextAlign.center,
              style: GlobalConstants.textStyle(
                family: 'Sans',
                fontSize: 15,
                color: isDark ? KColors.blackColor : KColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
