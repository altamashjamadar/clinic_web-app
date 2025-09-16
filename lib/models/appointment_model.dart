class AppointmentModel {
  final String patient;
  final String age;
  final String visitType;
  final String date;
  final String purpose;
  final String imageUrl;

  AppointmentModel({
    required this.patient,
    required this.age,
    required this.visitType,
    required this.date,
    required this.purpose,
    required this.imageUrl,
  });
}