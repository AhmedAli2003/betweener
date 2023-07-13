import 'package:betweener/core/entities/register_entity.dart';
import 'package:betweener/core/entities/user_entity.dart';
import 'package:betweener/core/network/request_status.dart';
import 'package:betweener/core/providers/auth_providers.dart';
import 'package:betweener/core/providers/params/register_param.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/constants/app_assets.dart';
import 'package:betweener/core/screens/loading_screen.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/primary_outlined_button_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/google_button_widget.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  late final FocusScopeNode _node;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;

  @override
  void initState() {
    super.initState();
    _node = FocusScopeNode();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
  }

  @override
  void dispose() {
    _node.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  String getErrorMessage(RegisterEntity registerEntity) {
    if (registerEntity.registerErrorEntity.emailErrors.isNotEmpty) {
      return registerEntity.registerErrorEntity.emailErrors[0];
    } else if (registerEntity.registerErrorEntity.passwordErrors.isNotEmpty) {
      return registerEntity.registerErrorEntity.passwordErrors[0];
    }
    return 'Unknown error';
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(registerStatusProvider);
    final registerEntity = ref.watch(registerEntityProvider);
    if (status == RequestStatus.loaded && registerEntity.user != const UserEntity.empty()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AppRouter.mainPage);
      });
    } else if (status == RequestStatus.loading) {
      return const LoadingScreen();
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (status == RequestStatus.error) {
            Future.delayed(Duration.zero, () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(getErrorMessage(registerEntity)),
                ),
              );
            });
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Form(
                  child: FocusScope(
                    node: _node,
                    child: Column(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 8,
                          child: Hero(
                            tag: 'authImage',
                            child: SvgPicture.asset(AppAssets.authImage),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PrimaryLabeledTextFieldWidget(
                          controller: _nameController,
                          hint: 'John Doe',
                          label: 'Name',
                          onEditingComplete: _node.nextFocus,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        PrimaryLabeledTextFieldWidget(
                          controller: _emailController,
                          hint: 'example@gmail.com',
                          label: 'Email',
                          onEditingComplete: _node.nextFocus,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        PrimaryLabeledTextFieldWidget(
                          controller: _passwordController,
                          hint: 'Enter password',
                          label: 'Password',
                          password: true,
                          onEditingComplete: _node.nextFocus,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        PrimaryLabeledTextFieldWidget(
                          controller: _passwordConfirmationController,
                          hint: 'Enter password again',
                          label: 'Password Confirmation',
                          password: true,
                          onEditingComplete: _node.nextFocus,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SecondaryButtonWidget(
                          onTap: () async {
                            ref.read(
                              registerProvider(
                                RegisterParam(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  passwordConfirmation: _passwordConfirmationController.text.trim(),
                                ),
                              ),
                            );
                          },
                          text: 'REGISTER',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PrimaryOutlinedButtonWidget(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, AppRouter.loginPage);
                          },
                          text: 'LOGIN',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '-  or  -',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GoogleButtonWidget(
                          onTap: () {
                            // TODO: Sign in with Google and move to the main page
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
