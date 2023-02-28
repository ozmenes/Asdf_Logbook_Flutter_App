import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? uid;
  String? userName;
  String? password;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? companyLicenceKey;
  UserModel(
      {this.uid,
      this.userName,
      this.password,
      this.userEmail,
      this.userPhone,
      this.userAddress,
      this.companyLicenceKey});
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userName': userName ?? '',
      'password': password ?? '',
      'userEmail': userEmail ?? '',
      'userPhone': userPhone ?? '',
      'userAddress': userAddress ?? '',
      'licence': companyLicenceKey ?? ''
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        userName = json['userName'] ?? '',
        password = json['password'] ?? '',
        userEmail = json['userEmail'] ?? '',
        userPhone = json['userPhone'] ?? '',
        userAddress = json['userAddress'] ?? '',
        companyLicenceKey = json['companyLicenceKey'] ?? '';

  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      UserModel.fromJson(doc.data()!);

}

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference<Map<String, dynamic>> userRef =
  FirebaseFirestore.instance.collection('users');
  final CollectionReference<Map<String, dynamic>> companyRef =
  FirebaseFirestore.instance.collection('companies');
  UserModel? userModel;

  Future<String?> addUser(Map<String, dynamic> data) async {
    String uid = _auth.currentUser?.uid ?? '';
    await userRef.doc(uid).set(data).then((value)async{
      var company = await companyRef.doc(uid).set({'uid':uid,'licence':uid});
      return company;
    });
    return uid;
  }

  List<UserModel> _usersListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel.fromDoc(doc);
    }).toList();
  }

  Stream<List<UserModel>>? get getUser {
    Stream<List<UserModel>>? stream;
    try {
      stream = userRef.snapshots().map(_usersListFromSnapshot);
    } catch (e) {
      debugPrint(e.toString());
    }
    return stream;
  }
}
