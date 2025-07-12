class UserProfileModel {
  final String name;
  final String email;
  final String birthDate;
  final String gender;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.gender,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['patient_name'],
      email: json['email'],
      birthDate: json['birth_date'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'patient_name': name, 'email': email, 'birth_date': birthDate, 'gender': gender};
  }
}
