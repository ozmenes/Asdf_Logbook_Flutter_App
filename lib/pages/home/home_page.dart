import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: const Center(
          child: Text('Hi'),
        ),
      ),
    );
  }
}
