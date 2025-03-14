import 'dart:convert';

import '../../utils/typedefs.dart';
import '../entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    super.street,
    super.apartment,
    super.city,
    super.postalCode,
    super.country,
  });

  const AddressModel.empty()
      : this(
          street: 'Test String',
          apartment: 'Test String',
          city: 'Test String',
          postalCode: 'Test String',
          country: 'Test String',
        );

  AddressModel.fromMap(DataMap map)
      : this(
          street: map['street'] as String?,
          apartment: map['apartment'] as String?,
          city: map['city'] as String?,
          postalCode: map['postalCode'] as String?,
          country: map['country'] as String?,
        );

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() {
    return <String, dynamic>{
      'street': street,
      'apartment': apartment,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }

  String toJson() => jsonEncode(toMap());

  AddressModel copyWith({
    String? street,
    String? apartment,
    String? city,
    String? postalCode,
    String? country,
  }) =>
      AddressModel(
        street: street ?? this.street,
        apartment: apartment ?? this.apartment,
        city: city ?? this.city,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
      );
}
