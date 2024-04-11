// model class representing user data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasty_dinery/utils/formatters/formatter.dart';

class UserModel {
  // keeping the values not meant to be changed
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;
  String role;

  // constructors for the fields
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.role,
  });

  // helper function to get full name
  String get fullName => '$firstName $lastName';

  // helper function to format phone number
  String get formattedPhoneNo => CcFormatter.formatPhoneNumber(phoneNumber);

  // static function to split full name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // static function to generate username from full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();

    String userName = firstName;
    return userName;
  }

  // static function to create empty user model
  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      userName: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      role: "client");

  // convert model to json format for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role,
    };
  }

  // factory method to create usermodel from firebase doc snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // if statement goes in here.....comprising of all the code below
    final data = document.data()!;
    return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        role: data['Role'] ?? 'client');
  }
}
