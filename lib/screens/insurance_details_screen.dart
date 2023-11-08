import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/models/insurance_person.dart';
import 'package:insuarnce_app/models/insurance_family_member.dart';

class InsurancePersonDetailsScreen extends StatelessWidget {
  final InsurancePersonController insuranceController = Get.find<InsurancePersonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance Person Details'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: insuranceController.insurancePersons.length,
          itemBuilder: (context, index) {
            InsurancePerson person = insuranceController.insurancePersons[index];
            return ListTile(
              title: Text('First Name: ${person.firstName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Last Name: ${person.lastName}'),
                  Text('Email: ${person.email}'),
                  Text('Phone Number: ${person.phoneNo}'),
                  Text('Address: ${person.address}'),
                  Text('Citizenship Image URL: ${person.citizenshipImage}'),
                  Text('insurance person image: ${person.insuredPersonImage}'),
                  Text('Amount Paid: ${person.amountPaid.toString()}'),
                  Text('Date of Insurance: ${person.dateOfInsurance.toString()}'),
                  Text('Date of Birth: ${person.dateOfBirth?.toString() ?? "N/A"}'),
                  Text('Sex: ${person.sex}'),
                  // Add any other details from the InsurancePerson model
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class InsuredFamilyMemberDetailsScreen extends StatelessWidget {
  final InsuredFamilyMemberController familyMemberController = Get.find<InsuredFamilyMemberController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Member Details'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: familyMemberController.insuredFamilyMembers.length,
          itemBuilder: (context, index) {
            InsuredFamilyMember familyMember = familyMemberController.insuredFamilyMembers[index];
            return ListTile(
              title: Text('Name: ${familyMember.name}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Insurance Person ID: ${familyMember.insurancePerson}'),
                  Text('Relationship: ${familyMember.relationship}'),
                  Text('Family Member Image: ${familyMember.familyMemberImage}'),
                  Text('Date of Birth: ${familyMember.fDateOfBirth?.toString() ?? "N/A"}'),
                  Text('Sex: ${familyMember.fSex}'),
                  // Add any other details from the InsuredFamilyMember model
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
