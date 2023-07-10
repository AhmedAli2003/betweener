import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class ActiveSharingItem extends StatelessWidget {
   String id;
   String name;

  ActiveSharingItem({required this.id, required this.name});

  PushDetail(BuildContext contextItem) {
    Navigator.of(contextItem)
        .pushNamed(AppRouter.friendProfile, arguments: {"id": id, "name": name});
    print(id+name);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PushDetail(context);
      }
      ,
      child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: AppColors.kLightPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: ListTile(title: Text(name), leading: Icon(Icons.person))),
    );
  }
}
