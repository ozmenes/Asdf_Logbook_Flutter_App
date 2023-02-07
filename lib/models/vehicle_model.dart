import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleType {
  String? vehicleType;
  String? vehicleSrc;
  bool isSelected;

  VehicleType(this.vehicleType, this.vehicleSrc, this.isSelected);
}

class VehicleModel {
  String? uid;
  String? brand;
  String? model;
  String? vehicleType;
  String? payload;
  String? vehicleCountry;
  String? vehiclePlate;
  String? vehicleLicenceKey;

  VehicleModel(
      {this.uid,
      this.brand,
      this.model,
      this.vehicleType,
      this.payload,
      this.vehicleCountry,
      this.vehiclePlate,
      this.vehicleLicenceKey});

  factory VehicleModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      VehicleModel(
        uid: doc.data()?['uid'],
        brand: doc.data()?['brand'] ?? '',
        model: doc.data()?['model'] ?? '',
        vehicleType: doc.data()?['vehicleType'] ?? '',
        payload: doc.data()?['payload'] ?? '',
        vehicleCountry: doc.data()?['vehicleCountry'] ?? '',
        vehiclePlate: doc.data()?['vehiclePlate'] ?? '',
        vehicleLicenceKey: doc.data()?['vehicleLicenceKey'] ?? '',
      );
}

class VehicleService {}
