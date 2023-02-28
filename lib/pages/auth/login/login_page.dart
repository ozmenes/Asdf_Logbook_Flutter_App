import 'package:asdf_logbook/models/user_auth_model.dart';
import 'package:asdf_logbook/pages/auth/register/registration_driver_company.dart';
import 'package:asdf_logbook/pages/home/home_page.dart';
import 'package:asdf_logbook/pages/home/welcome_page.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  late UserAuthService userAuthService;
  final String loginError = 'could not sign in with those credentials.';
  @override
  void initState() {
    userAuthService = UserAuthService();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '',
            style: TextStyle(color: blackColor),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const WelcomePage())),
                icon: const Icon(
                  Icons.login,
                  color: blackColor,
                ))
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login to your Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email Address"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = true;
                              });
                            },
                          ),
                          const Text('Remember me!'),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              debugPrint('password');
                            },
                            child: const Text('Forgot password?',
                                style: TextStyle(
                                  color: darkGreyColor,
                                )))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          minimumSize: Size(size.width / 2.5, 42),
                          //minimumSize: Size(size.width / 1.25, 42),
                          side: const BorderSide(color: blueColor, width: 2),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            dynamic loginResult = await userAuthService
                                .signInWithEmailAndPassword(emailController.text, passwordController.text);
                            if (loginResult == null) {
                              debugPrint(loginError);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => const HomePage()));
                            }
                            debugPrint('valid');
                          }
                          debugPrint('Logged in');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      const RegisterDriverOrCompany()));
                          debugPrint('first');
                        },
                        child: const Text('First time here?',
                            style: TextStyle(
                              color: darkGreyColor,
                              decoration: TextDecoration.underline,
                            )))),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
