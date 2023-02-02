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
    return Container();
  }
}
