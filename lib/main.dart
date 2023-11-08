import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/screens/home_screen.dart';
import 'package:insuarnce_app/services/api_service.dart';

void main() {
  final ApiService apiService = ApiService('http://127.0.0.1:8000/api'); // Replace with your ApiService instance

  runApp(MyApp(apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  MyApp(this.apiService);

  @override
  Widget build(BuildContext context) {
    Get.put(InsurancePersonController(apiService));
    Get.put(InsuredFamilyMemberController(apiService));

    return GetMaterialApp(
      title: 'Your App',
      home: HomeScreen(),
      // Other configurations
    );
  }
}
