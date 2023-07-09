import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';
class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 126,
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/imgs/parson.png',
              width: 84,
              height: 84,
            ),
          ),
          const Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'example@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '+9700000000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {},
              icon:const Icon(Icons.mode_edit_outline_outlined,color: AppColors.kScaffoldColor,),
              padding: const EdgeInsets.only(bottom: 80),
            ),
          ),
        ],
      ),
    );
  }
}
