import 'dart:convert';

class PhoneModel {
  final int ddd;
  final String phone;

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
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) => PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
