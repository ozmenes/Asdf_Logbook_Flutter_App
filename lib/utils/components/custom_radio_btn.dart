import 'package:asdf_logbook/models/subscription_type.dart';
import 'package:asdf_logbook/models/vehicle_model.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class CustomRadioBtn extends StatelessWidget {
  const CustomRadioBtn({Key? key, required this.subscription}) : super(key: key);
  final Subscription subscription;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: subscription.isSelected ? blackColor : greyColor,
      child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${subscription.name}',
                style: const TextStyle(
                  fontSize: 20,
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${subscription.price}',
                style: const TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          )),
    );
  }
}
class CustomVehicleRadioBtn extends StatelessWidget {
  const CustomVehicleRadioBtn({Key? key, required this.vehicle}) : super(key: key);
  final VehicleType vehicle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: vehicle.isSelected ? blackColor : greyColor,
      child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/images/${vehicle.vehicleSrc}",
                  fit: BoxFit.fitWidth,
                ),
              ),

              Expanded(
                flex: 1,
                child: Text(
                  '${vehicle.vehicleType}',
                  style: const TextStyle(
                    fontSize: 19,
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}