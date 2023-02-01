import 'package:asdf_logbook/pages/home/home_page.dart';
import 'package:asdf_logbook/pages/home/welcome_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? uid;
    uid = "";
    if(uid ==null){
      return const WelcomePage();
    }else{
      return const HomePage();
    }
  }
}
