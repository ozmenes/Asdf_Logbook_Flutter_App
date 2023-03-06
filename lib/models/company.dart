import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  String? companyTd;
  String? companyLicenceKey;
  String? role;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyAddress;
  // String? licenceType;  //arr
  // String? licenceStatus; //arr
  // String? licencePackage; //arr
  // String? licencePayment; //arr
  CompanyModel(
      {this.companyTd,
      this.companyLicenceKey,
      this.role,
      this.companyName,
      this.companyEmail,
      this.companyPhone,
      this.companyAddress});
  Map<String, dynamic> toJson() {
    return {
      'companyTd': companyTd,
      'companyLicenceKey': companyLicenceKey,
      'role': role,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyPhone': companyPhone,
      'companyAddress': companyAddress,
    };
  }

  CompanyModel.fromJson(Map<String, dynamic> json)
      : companyTd = json['companyTd'] ?? '',
        companyLicenceKey = json['companyLicenceKey'] ?? '',
        role = json['role'] ?? '',
        companyName = json['companyName'] ?? '',
        companyEmail = json['companyEmail'] ?? '',
        companyPhone = json['companyPhone'] ?? '',
        companyAddress = json['companyAddress'] ?? '';
  factory CompanyModel.fromDoc(DocumentSnapshot<Map<String,dynamic>> doc)=>
      CompanyModel.fromJson(doc.data()!);
}
class CompanyService{
  final CollectionReference<Map<String, dynamic>> companyRef =
  FirebaseFirestore.instance.collection('companies');
  //add
  Future<void> addCompanyInfo(Map<String, dynamic> data,String companyId)async{
    await companyRef.doc(companyId).set(data);
  }
  //update
  Future<void> updateCompanyInfo(Map<String, dynamic> data,String companyId)async{
    await companyRef.doc(companyId).update(data);
  }
  //delete
  //search and list
}
