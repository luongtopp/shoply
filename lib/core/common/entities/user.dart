import 'package:equatable/equatable.dart';
import '../../utils/typedefs.dart';
import 'address.dart';
import 'wishlist_product.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.wishlist,
    this.address,
    this.phone,
  });

  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<WishlistProduct> wishlist;
  final Address? address;
  final String? phone;

  const User.empty()
      : id = 'Test string',
        name = 'Test string',
        email = 'Test string',
        isAdmin = true,
        wishlist = const [],
        address = null,
        phone = null;

  @override
  List<Object?> get props => [id, name, email, isAdmin, wishlist.length];

  factory User.fromMap(DataMap map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      wishlist: map['wishlist'] as List<WishlistProduct>,
      address: map['address'] as Address,
      phone: map['phone'] as String,
    );
  }
}
