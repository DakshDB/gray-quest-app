import 'package:gray_quest/model/post_model.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? website;
  String? company;
  Address? address;
  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.phone,
      this.website,
      this.company,
      this.address});

  factory User.fromJson(dynamic map) {
    return User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        username: map['username'],
        phone: map['photo'],
        website: map['website'],
        company: map['company']['name'],
        address: Address.fromJson(map['address']));
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Address(
      {required this.street,
      required this.city,
      required this.suite,
      required this.zipcode});

  factory Address.fromJson(dynamic map) {
    return Address(
        street: map['street'],
        suite: map['suite'],
        city: map['city'],
        zipcode: map['zipcode']);
  }
}
