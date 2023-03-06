import 'package:asdf_logbook/models/company.dart';
import 'package:asdf_logbook/utils/widgets/base_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key,headerTitleText: 'Logbook');

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePageState<HomePage> {
  late bool isDarkMode;
  final formKey = GlobalKey<FormState>();
  final licenceCheckController = TextEditingController();
  final String licenceText = 'company_licence';
  late CompanyService companyService;
  late CompanyModel companyModel;
  @override
  void initState() {
    companyModel = CompanyModel();
    companyService = CompanyService();
    super.initState();
  }
  @override
  Widget buildPageUI(){
    //final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  //Text(licenceText),
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: licenceText,
                        //border: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.copy))
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: licenceCheckController,
                      decoration: InputDecoration(
                        labelText:"Enter your licence to activate",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                        }
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Licence successfully saved.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: ()=>_updateCompany(),
                child: const Text('Update'),
              ),
            ],
          ),
        )
      ],
    );
  }
  void _updateCompany()async{
    try{
      final FirebaseAuth auth = FirebaseAuth.instance;
      var companyId = auth.currentUser?.uid;
      // companyModel.companyName = 'Enes GmbH';
      // companyModel.companyLicenceKey = companyId;
      // companyModel.companyTd = companyId;
      // companyModel.role = 'Owner';
      // companyModel.companyPhone = '0123456789';
      // companyModel.companyEmail = 'eneszmn@hotmail.com';
      companyModel.companyAddress = 'KS';

      await companyService.updateCompanyInfo(companyModel.toJson(), companyId!);
      debugPrint('${companyModel.companyName} has updated.');
    }catch(e){
      debugPrint('${companyModel.companyName} could not updated.');
    }
  }
}
