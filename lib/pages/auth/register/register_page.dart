import 'package:asdf_logbook/models/subscription_type.dart';
import 'package:asdf_logbook/models/user_auth_model.dart';
import 'package:asdf_logbook/models/user_model.dart';
import 'package:asdf_logbook/pages/home/welcome_page.dart';
import 'package:asdf_logbook/utils/components/validator_service.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, required this.isAccountCompany})
      : super(key: key);
  final bool isAccountCompany;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int currentStep = 0;
  bool isTermsAndConditionsAgree = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final ownerNamedController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final numberOfVehicleController = TextEditingController();
  List<Subscription> subscription = <Subscription>[];
  late String? subscriptionType;
  final UserAuthService userAuthService = UserAuthService();
  final UserService userService = UserService();
  UserModel? user;
  @override
  void initState() {
    debugPrint("isAccountCompany ${widget.isAccountCompany}");
    subscription.add(Subscription("Free", '-', false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Registration Form',
          //style: TextStyle(color: blackColor),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const WelcomePage())),
              icon: const Icon(
                Icons.login,
                color: blackColor,
              ))
        ],
      ),
      //backgroundColor: blueColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: blackColor)),
            child: Stepper(
              elevation: 0,
              type: StepperType.horizontal,
              physics: const ScrollPhysics(),
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () async {
                /// send data to server
                if (formKey.currentState!.validate()) {
                  if (isTermsAndConditionsAgree == true) {
                    createUser();
                    debugPrint('User creation has been completed.');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const WelcomePage()));
                  } else {
                    return debugPrint('isTermsAndConditionsAgree error');
                  }
                } else {
                  return debugPrint('Validation error');}
                // final isLastStep = currentStep == getSteps().length - 1;
                // if (isLastStep) {
                //   if (widget.isAccountCompany == false) {
                //     ownerNamedController.text = '';
                //     numberOfVehicleController.text = '';
                //   }
                //   if (formKey.currentState!.validate()) {
                //     if (isTermsAndConditionsAgree == true) {
                //       createUser();
                //       debugPrint('User creation has been completed.');
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (builder) => const WelcomePage()));
                //     } else {
                //       return debugPrint('isTermsAndConditionsAgree error');
                //     }
                //   } else {
                //     return debugPrint('Validation error');
                //   }
                // } else {
                //   setState(() => currentStep += 1);
                // }
              },
              onStepCancel: currentStep == 0
                  ? null
                  : () => setState(() => currentStep -= 1),
              onStepTapped: (step) => setState(() => currentStep = step),
              controlsBuilder: (context, ControlsDetails details) {
                final isLastStep = currentStep == getSteps().length - 1;
                return Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlueColor,
                              minimumSize: Size(size.width / 2.5, 42),
                              side: const BorderSide(
                                  color: darkBlueColor, width: 2),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                            ),
                            onPressed: details.onStepContinue,
                            child: Text(isLastStep ? "Confirm" : 'Next')),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      if (currentStep != 0)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blackColor,
                              minimumSize: Size(size.width / 2.5, 42),
                              side:
                                  const BorderSide(color: blackColor, width: 2),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                            ),
                            onPressed: details.onStepCancel,
                            child: const Text(
                              'Back',
                              style: TextStyle(color: whiteColor),
                            )),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool isChecked = false;
  List<Step> getSteps() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return [
      Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Account'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Account Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email Address"),
                validator: (val) =>
                    val!.isValidEmail() ? null : "Please check your email",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars long.' : null,
              ),
            ],
          )),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
              widget.isAccountCompany == true ? 'Company Info' : "User Info"),
          content: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.isAccountCompany == true
                      ? "Company Information"
                      : "User Information",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      labelText: widget.isAccountCompany == true
                          ? "Company Name"
                          : "User Name"),
                  validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: widget.isAccountCompany == true,
                  child: TextFormField(
                    controller: ownerNamedController,
                    decoration: const InputDecoration(labelText: "Owner Name"),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter your full name' : null,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter your phone number' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: "Address"),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter your address' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
      Step(
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Check your information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isAccountCompany == true
                        ? 'Company Name : '
                        : "User Name :",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    userNameController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                visible: widget.isAccountCompany == true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Company Owner Name : ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      ownerNamedController.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email Address : ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    emailController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Phone Number : ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    phoneNumberController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Address : ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    addressController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 40,
                color: greyColor,
                endIndent: 0,
                indent: 0,
                thickness: 2,
              ),
              CheckboxListTile(
                  title: Text(
                    'Agree to Asdf Logbook Terms & Conditions',
                    style:
                        TextStyle(color: isDarkMode ? whiteColor : blueColor),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: darkBlueColor,
                  value: isTermsAndConditionsAgree,
                  onChanged: (onChanged) {
                    setState(() {
                      isTermsAndConditionsAgree = onChanged!;
                    });
                  })
              //Text("$subType"),
            ],
          )),
    ];
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  Future createUser() async {
    try {
      // registerWithEmailAndPassword
      dynamic userResult = await userAuthService.registerWithEmailAndPassword(emailController.text, passwordController.text);
      debugPrint('username: ${emailController.text} pass: ${passwordController.text}');
      // create user and save info
      var uid= await userService.addUser(user!.toJson());
      user!.uid = uid;

      if(userResult == null){
        debugPrint("userResult error : $userResult");

      }else{
        // signOut
        await userAuthService.signOut(context);
      }

      debugPrint(userNameController.text +
          ownerNamedController.text +
          emailController.text +
          phoneNumberController.text +
          addressController.text +
          subscriptionType! +
          numberOfVehicleController.text);
      Navigator.pushNamed(context, '/home',arguments: uid);
    } catch (e) {
      debugPrint("Registration error : $e");
    }
  }
}
