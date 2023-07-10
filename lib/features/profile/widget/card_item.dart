import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.itemList,
  });

  final List<String> itemList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          final isFirstElement = index % 2 == 0;
          final itemColor = isFirstElement ? AppColors.kLightDangerColor : AppColors.kLightPrimaryColor;
          final itemOnColor = isFirstElement ? AppColors.kOnLightDangerColor : AppColors.kPrimaryColor;

          return Slidable(
            key: Key('$item$index'),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.newOrEditLink);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.kDangerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            child: ListTile(
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        color: itemOnColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'https://www.$item.com',
                      style: TextStyle(
                        color: itemOnColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void doNothing(BuildContext context) {}
