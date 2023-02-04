import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:asdf_logbook/utils/widgets/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key,headerTitleText: 'Logbook');

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePageState<HomePage> {
  late bool isDarkMode;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget buildPageUI(){
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Last or Current Drive
        Container(
          color: blackColor.withOpacity(.3),
          width: size.width,
          height: 200,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.drive_eta_rounded,
                        color: Colors.green,size: 32,
                      ),
                      Text(
                        "Driving",
                        style: TextStyle(
                          fontSize: 20,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.directions,size: 32,))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
