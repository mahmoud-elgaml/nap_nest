class PatientModel {
  final String patientName;
  final String email;
  final String gender;
  final String birthDate;
  final int patientId;

  PatientModel({
    required this.patientName,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.patientId,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientName: json['patient_name'],
      email: json['email'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      patientId: json['patient_id'],
    );
  }
}

