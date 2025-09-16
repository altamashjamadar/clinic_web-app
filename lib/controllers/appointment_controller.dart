import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/appointment_model.dart';

class AppointmentController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  var appointments =
      <AppointmentModel>[
        AppointmentModel(
          patient: 'Sarah Johnson',
          age: '28',
          visitType: 'First Visit',
          date: 'Dec 15, 2024 • 10:30 AM',
          purpose: 'Routine Checkup',
          imageUrl: 'assets/profile_0.png',
        ),
        AppointmentModel(
          patient: 'Emily Davis',
          age: '32',
          visitType: 'Follow-up',
          date: 'Dec 16, 2024 • 2:00 PM',
          purpose: 'Prenatal Care',
          imageUrl: 'assets/profile_1.png',
        ),
      ].obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      timeController.text = pickedTime.format(context);
    }
  }

  void requestAppointment() {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        dateController.text.isEmpty ||
        timeController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final newAppointment = AppointmentModel(
      patient: fullNameController.text,
      age: 'N/A',
      visitType: 'New',
      date: '${dateController.text} • ${timeController.text}',
      purpose: descriptionController.text,
      imageUrl: 'assets/profile_0.png', // Placeholder
    );

    appointments.add(newAppointment);
    Get.snackbar(
      'Success',
      'Appointment request submitted for ${fullNameController.text}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Clear fields
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    descriptionController.clear();
    dateController.clear();
    timeController.clear();
  }

  void acceptAppointment(int index) {
    appointments.removeAt(index);
    update();
  }

  void rejectAppointment(int index) {
    appointments.removeAt(index);
    update();
  }
}
