import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class ActiveSharingItem extends StatelessWidget {
  final String id;
  final String name;

  const ActiveSharingItem({
    super.key,
    required this.id,
    required this.name,
  });

  void pushDetail(BuildContext contextItem) {
    Navigator.of(contextItem).pushNamed(
      AppRouter.friendProfile,
      arguments: {"id": id, "name": name},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushDetail(context);
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: AppColors.kLightPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: ListTile(
          title: Text(name),
          leading: const Icon(Icons.person),
        ),
      ),
    );
  }
}
