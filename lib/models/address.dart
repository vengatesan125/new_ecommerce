class Address {

  final String id;
  final String name;
  final String phone;
  final String street;
  final String city;
  final String state;
  final String pincode;
  final bool isDefault;

  Address({
    required this.id,
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
    this.isDefault = false,
  });

  String get fullAddress => '$street, $city, $state - $pincode';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'street': street,
      'city': city,
      'state': state,
      'pincode': pincode,
      'isDefault': isDefault,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  Address copyWith({
    String? id,
    String? name,
    String? phone,
    String? street,
    String? city,
    String? state,
    String? pincode,
    bool? isDefault,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
