import 'package:asdf_logbook/pages/auth/register/register_page.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterDriverOrCompany extends StatelessWidget {
  const RegisterDriverOrCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: darkBlueColor.withOpacity(0.3),
                child: CircleAvatar(
                  backgroundColor: darkBlueColor,
                  radius: 70,
                  child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=> const RegistrationPage(isAccountCompany: true,))),
                    child: SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.asset(
                        "assets/images/warehouse-white.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: darkBlueColor,
            thickness: 5,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: darkBlueColor.withOpacity(0.3),
                child: CircleAvatar(
                  backgroundColor: darkBlueColor,
                  radius: 70,
                  child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=> const RegistrationPage(isAccountCompany: false,))),
                    child: SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.asset(
                        "assets/images/wheel-white.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}