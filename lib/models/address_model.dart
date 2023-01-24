import 'package:adf_cli/models/city_model.dart';
import 'package:adf_cli/models/phone_model.dart';

class AddressModel {
  String street;
  int number;
  String zipCode;
  CityModel city;
  PhoneModel phone;

  AddressModel({
      required this.street,
      required this.number,
      required this.zipCode,
      required this.city,
      required this.phone,
      });
}
