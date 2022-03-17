import 'package:dependencies/dependencies.dart';

class UserEntity extends Equatable {
  UserEntity({
    this.id,
    this.email,
    this.image,
    this.name,
    this.phoneNumber,
    this.address,
  });

  final String id;
  final String email;
  final String image;
  final String name;
  final String phoneNumber;
  final String address;

  @override
  List<Object> get props => [
        id,
        email,
        image,
        name,
        phoneNumber,
        address,
      ];

  @override
  bool get stringify => true;
}
