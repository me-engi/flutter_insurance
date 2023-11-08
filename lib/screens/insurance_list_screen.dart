import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/models/insurance_person.dart';
import 'package:insuarnce_app/screens/insurance_details_screen.dart';


class InsuranceListScreen extends StatelessWidget {
  final InsurancePersonController insuranceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance List'),
      ),
      body: Obx(() => insuranceController.insurancePersons.isEmpty
          ? Center(child: Text('No insurance persons available.'))
          : ListView.builder(
              itemCount: insuranceController.insurancePersons.length,
              itemBuilder: (context, index) {
                final InsurancePerson insurancePerson = insuranceController.insurancePersons[index];
                return ListTile(
                  title: Text(insurancePerson.firstName),
                  subtitle: Text(insurancePerson.email),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Navigate to the details screen for the selected insurance person.
                      Get.to(InsurancePersonDetailsScreen());
                    },
                  ),
                );
              },
            )),
    );
  }
}
