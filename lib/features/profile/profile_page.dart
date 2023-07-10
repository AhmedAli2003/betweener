import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:betweener/features/profile/widget/card_item.dart';
import 'package:betweener/features/profile/widget/card_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<String> itemList = [
    'Instagram',
    'Twitter',
    'LinkedIn',
    'Facebook',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColors.kPrimaryColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const CardProfile(),
            const SizedBox(height: 30),
            CardItem(itemList: itemList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.kPrimaryColor,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
