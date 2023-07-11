import 'package:betweener/core/network/request_status.dart';
import 'package:betweener/core/providers/auth_providers.dart';
import 'package:betweener/core/providers/params/login_param.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/constants/app_assets.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/primary_outlined_button_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/google_button_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(loginStatusProvider) == RequestStatus.loaded) {
      print(ref.watch(loginEntityProvider));
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, AppRouter.mainPage);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: Hero(
                    tag: 'authImage',
                    child: SvgPicture.asset(AppAssets.authImage),
                  ),
                ),
                const Spacer(),
                PrimaryLabeledTextFieldWidget(
                  controller: _emailController,
                  hint: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextFieldWidget(
                  controller: _passwordController,
                  hint: 'Enter password',
                  label: 'password',
                  password: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SecondaryButtonWidget(
                  onTap: () {
                    //TODO:
                    ref.read(
                      loginProvider(
                        LoginParm(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      ),
                    );
                  },
                  text: 'LOGIN',
                ),
                const SizedBox(
                  height: 24,
                ),
                PrimaryOutlinedButtonWidget(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRouter.registerPage);
                  },
                  text: 'REGISTER',
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
                    Navigator.pushReplacementNamed(context, AppRouter.mainPage);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
