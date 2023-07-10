import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/features/settings/user_data.dart';
import 'package:flutter/material.dart';

class EditUserInfoPage extends StatefulWidget {
  final UserData userData;
  const EditUserInfoPage({
    required this.userData,
    super.key,
  });

  @override
  State<EditUserInfoPage> createState() => _EditUserInfoPageState();
}

class _EditUserInfoPageState extends State<EditUserInfoPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData.username);
    _emailController = TextEditingController(text: widget.userData.email);
    _phoneController = TextEditingController(text: widget.userData.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User Info'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
        ),
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              height: height - (Scaffold.of(context).appBarMaxHeight ?? 0.0),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                    ),
                  ),
                  const Spacer(),
                  PrimaryLabeledTextFieldWidget(
                    controller: _nameController,
                    label: 'Name',
                    keyboardType: TextInputType.url,
                  ),
                  const Spacer(),
                  PrimaryLabeledTextFieldWidget(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.url,
                  ),
                  const Spacer(),
                  PrimaryLabeledTextFieldWidget(
                    controller: _phoneController,
                    label: 'Phone',
                    keyboardType: TextInputType.phone,
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
