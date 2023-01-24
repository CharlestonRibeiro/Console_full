import 'dart:convert';

class PhoneModel {
  int ddd;
  String phone;

  PhoneModel({
    required this.ddd,
    required this.phone,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'phone': phone,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      ddd: map['ddd'] as int,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) => PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
