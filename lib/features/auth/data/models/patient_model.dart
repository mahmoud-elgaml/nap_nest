class PatientModel {
  final int patientId;
  final String patientName;
  final String email;
  final String gender;
  final String birthDate;

  PatientModel({
    required this.patientId,
    required this.patientName,
    required this.email,
    required this.gender,
    required this.birthDate,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientId: json['patient_id'],
      patientName: json['patient_name'],
      email: json['email'],
      gender: json['gender'],
      birthDate: json['birth_date'],
    );
  }
}
