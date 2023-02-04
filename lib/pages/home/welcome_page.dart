import 'package:asdf_logbook/pages/auth/login/login_page.dart';
import 'package:asdf_logbook/pages/auth/register/registration_driver_company.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: darkBlueColor.withOpacity(0.3),
                      child: CircleAvatar(
                        backgroundColor: darkBlueColor,
                        radius: 70,
                        child: SizedBox(
                          height: 90,
                          width: 100,
                          child: Image.asset(
                            "assets/images/delivery-white.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.bold,
                            color: white2Color),
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const Text(
                        "ASDF Logbook",
                        style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.bold,
                            color: white2Color),
                      ),
                      const SizedBox(
                        height: defaultPadding * 2,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          minimumSize: Size(size.width / 1.25, 42),
                          side: const BorderSide(color: whiteColor, width: 2),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (builder)=> const LoginPage())),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: blueColor,fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          minimumSize: Size(size.width / 1.25, 42),
                          side: const BorderSide(color: whiteColor, width: 2),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> const RegisterDriverOrCompany()));
                        },
                        child: const Text(
                          'Registration',
                          style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
