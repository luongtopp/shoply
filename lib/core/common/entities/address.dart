import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? apartment;
  final String? city;
  final String? postalCode;
  final String? country;

  const Address({
    this.street,
    this.apartment,
    this.city,
    this.postalCode,
    this.country,
  });

  const Address.empty()
      : street = 'Test String',
        apartment = 'Test String',
        city = 'Test String',
        postalCode = 'Test String',
        country = 'Test String';

  bool get isEmpty => [street, apartment, city, postalCode, country]
      .every((element) => element == null);

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [
        street,
        apartment,
        city,
        postalCode,
        country,
      ];
}
