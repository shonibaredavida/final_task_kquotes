class UserModel {
  UserModel({
    required this.fullName,
    required this.email,
    this.profilePictureUrl,
  });

  final String fullName;
  final String email;
  final String? profilePictureUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fullName: json['fullName'],
    email: json['email'],
  );

}