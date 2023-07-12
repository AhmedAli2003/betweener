import 'package:betweener/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/provider/link_provider_controller.dart';
import '../../core/router/app_router.dart';
import 'widgets/container_link_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LinkProviderController>(context,listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text(
            'Hello, Ahmed!',
            style: GoogleFonts.roboto(
                fontSize: 28,
                color: const Color(0xff2D2B4E),
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          AppAssets.qrImage,
          color: const Color(0xff2D2B4E),
          height: 180,
          width: double.infinity,
        ),
        const SizedBox(
          height: 50,
        ),
        const Divider(
          color: Colors.black,
          indent: 80,
          endIndent: 80,
          thickness: 2.5,
        ),
        const SizedBox(
          height: 20,
        ),
        ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: Row(
              children: [
                Consumer<LinkProviderController>(
                  builder: (context, value, child) {
                    if (value.linkF.isNotEmpty) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.linkF.length,
                        itemBuilder: (context, index) {
                          return ListT(
                            title: value.linkF[index].title!,
                            subtitle: value.linkF[index].link!,
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.newOrEditLink);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.add), Text('Add')],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }


}
