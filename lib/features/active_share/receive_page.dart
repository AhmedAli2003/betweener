import 'package:flutter/material.dart';
import '../../core/widgets/active_sharing_item.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
            margin: const EdgeInsets.all(50),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/imgs/img.png",
              width: 120,
              height: 200,
            )),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, i) {
              return const ActiveSharingItem(
                name: "ahmed Ali",
                id: "123",
              );
            },
          ),
        ),
      ]),
    );
  }
}
