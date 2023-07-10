
import 'package:flutter/material.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import '../../core/widgets/active_sharing_item.dart';



class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Active Sharing",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: AppColors.kPrimaryColor)),
      ),
      body: Center(
        child: Column(
            children: [

              Container(
                  margin: EdgeInsets.all(50), alignment: Alignment.center,
                  child: Image.asset("assets/imgs/img.png",width: 120,height: 200, )),
              Expanded(flex: 3,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  itemBuilder: (context, i) {

                    return ActiveSharingItem(name: "ahmed Ali",id: "123",);
                  },
                ),
              ),
            ]),
      ),
    );
  }
}

