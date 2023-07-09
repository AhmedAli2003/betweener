import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/constants/app_assets.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/primary_outlined_button_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/google_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
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
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextFieldWidget(
                  controller: _emailController,
                  hint: 'example@gmail.com',
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
                    // TODO: Register and move to the main page
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
    );
  }
}
