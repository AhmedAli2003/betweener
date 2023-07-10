import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class FriendProfilePage extends StatelessWidget {
  const FriendProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // String id = "";
    // String name = "no name";

    // if (ModalRoute.of(context)?.settings.arguments != null) {
    //   final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    //   id = routeArgument["id"] ?? "No Id";
    //   name = routeArgument["name"] ?? "No Name";
    // }
    // final routeArgument =
    // ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    // final id = routeArgument?["id"] ?? "NoData";
    // final name = routeArgument?["name"] ??"NoData";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: AppColors.kPrimaryColor,
          weight: 600,
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Foo Bar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          const FriendProfileCard(),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, i) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                  decoration: BoxDecoration(
                    color: i % 2 == 0 ? AppColors.kLightPrimaryColor : AppColors.kLightDangerColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "title",
                        style: TextStyle(color: AppColors.kOnLightDangerColor, fontSize: 22, letterSpacing: 3),
                      ),
                      Text(
                        "sdJHUIFHiojhzsdihioxj",
                        style: TextStyle(color: AppColors.kLinksColor, fontSize: 17),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FriendProfileCard extends StatelessWidget {
  const FriendProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(39),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 24),
              child: CircleAvatar(
                  radius: 48.5,
                  foregroundImage:
                      NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt7bdKtm63vRa35-iYWQQTV7lQJ2shgGo62w&usqp=CAU")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "suhshhyshs@xjsjhs",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(
                  height: 6,
                ),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.kSecondaryColor)),
                  onPressed: () {},
                  child: const Text(
                    "Follow",
                    style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
