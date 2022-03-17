import 'package:dependencies/dependencies.dart';

import '../../../../auth.dart';

class UserModel extends Equatable {
  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        image: json["image"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "image": image,
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address,
      };

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      image: image,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
    );
  }

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
