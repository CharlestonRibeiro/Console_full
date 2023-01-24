import 'dart:convert';
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      number: map['number'] as int,
      zipCode: map['zipCode'] as String,
      city: CityModel.fromMap(map['city'] as Map<String,dynamic>),
      phone: PhoneModel.fromMap(map['phone'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
