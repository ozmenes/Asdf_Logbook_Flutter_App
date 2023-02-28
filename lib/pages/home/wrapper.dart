import 'package:asdf_logbook/models/user_auth_model.dart';
import 'package:asdf_logbook/pages/home/home_page.dart';
import 'package:asdf_logbook/pages/home/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuthModel?>(context);
    debugPrint('Current uid => ${user?.uid}');
    if(user?.uid ==null){
      return const WelcomePage();
    }else{
      return const HomePage();
    }
  }
}
