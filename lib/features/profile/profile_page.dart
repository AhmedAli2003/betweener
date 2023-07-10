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
    return Center(
      child: Column(
        children: [
          const CardProfile(),
          const SizedBox(height: 30),
          CardItem(itemList: itemList),
        ],
      ),
    );
  }
}
