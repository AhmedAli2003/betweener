import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class FriendProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String id = "";
    String name = "no name";


    if (ModalRoute.of(context)?.settings.arguments != null){
      final routeArgument =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
       id = routeArgument["id"] ?? "No Id";
       name = routeArgument["name"]  ?? "No Name";
    }
    // final routeArgument =
    // ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    // final id = routeArgument?["id"] ?? "NoData";
    // final name = routeArgument?["name"] ??"NoData";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColors.kPrimaryColor,weight: 600),
        leading: Navigator.canPop(context) ? IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)): null ,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("$name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.kPrimaryColor)),
      ),
      body: Column(children: [
        FriendProfileCard(),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            itemBuilder: (context, i) {
              return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 30, left: 30, top: 20),
                  decoration: BoxDecoration(
                      color: i % 2 == 0 ? AppColors.kLightPrimaryColor :  AppColors.kLightDangerColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "title",
                        style: TextStyle(color: AppColors.kOnLightDangerColor, fontSize: 22,letterSpacing: 3),
                      ),
                      Text(
                        "sdJHUIFHiojhzsdihioxj",
                        style: TextStyle(color: AppColors.kLinksColor, fontSize: 17),
                      )
                    ],
                  ));
            },
          )
        ),
      ]),
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
      margin: EdgeInsets.all(39),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CircleAvatar(
                  radius: 48.5,
                  foregroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt7bdKtm63vRa35-iYWQQTV7lQJ2shgGo62w&usqp=CAU")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "data",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "suhshhyshs@xjsjhs",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 6,
                ),
                ElevatedButton(
                    style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(AppColors.kSecondaryColor)),
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(color:AppColors.kPrimaryColor, fontSize: 15),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
