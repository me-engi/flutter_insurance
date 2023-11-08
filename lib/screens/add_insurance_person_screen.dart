import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/models/insurance_family_member.dart';
import 'package:insuarnce_app/models/insurance_person.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class AddInsuranceScreen extends StatelessWidget {
  final InsurancePersonController insurancePersonController = Get.find<InsurancePersonController>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController amountPaidController= TextEditingController();


  String? selectedSex;
    String? selectedInsurancePersonImage;
  String? selectedCitizenshipImage;

  Future<void> getImageFromGallery(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      // Check which image type is selected and assign the corresponding variable
      if (source == ImageSource.gallery) {
        selectedCitizenshipImage = image.path;
      } else {
        selectedInsurancePersonImage = image.path;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Insurance Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: middleNameController,
              decoration: InputDecoration(labelText: 'Middle Name'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: amountPaidController,
              decoration: InputDecoration(labelText: 'Amount Paid'),
            ),

    
            TextFormField(
              controller: dateOfBirthController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (date != null) {
                  dateOfBirthController.text =
                      '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                }
              },
            ),
            DropdownButtonFormField<String>(
              value: selectedSex,
              decoration: InputDecoration(labelText: 'Sex'),
              items: [
                DropdownMenuItem(child: Text('Male'), value: 'M'),
                DropdownMenuItem(child: Text('Female'), value: 'F'),
                DropdownMenuItem(child: Text('Other'), value: 'O'),
              ],
              onChanged: (value) {
                selectedSex = value;
              },
            ),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.gallery), // Assign gallery as source
              child: Text('Pick Citizenship Image'),
            ),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.camera), // Assign camera as source
              child: Text('Pick Insurance Person Image'),
            ),

            ElevatedButton(
              onPressed: () async {
                InsurancePerson newInsurancePerson = InsurancePerson(
                  id: 1, // Assign ID if necessary
                  firstName: firstNameController.text,
                  middleName: middleNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  phoneNo: phoneController.text,
                  address: addressController.text,
                  citizenshipImage: selectedCitizenshipImage ?? '', // Assign image URL if necessary
                  amountPaid: '500', // Assign the amount paid if necessary
                  dateOfInsurance: DateTime.now(), // Assign the date of insurance
                  sex: selectedSex ?? '',
                  familyMembers: [], // Initialize insured family members list
                  insuredPersonImage: selectedInsurancePersonImage ?? '',
                  dateOfBirth: DateTime.now(), 
                  // Assign date of birth
                );
                insurancePersonController.addInsurancePerson(newInsurancePerson);
                    final Uri apiUrl = Uri.parse('http://127.0.0.1:8000/api/insurance-person/'); // Your API endpoint

                    final response = await http.post(
                      apiUrl,
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        },
                          body: jsonEncode(newInsurancePerson.toJson()), // Convert to JSON
                          );

                        if (response.statusCode == 200) {
                        print('Data sent successfully!');
                       // Optionally, handle the success case
                        } else {
                          print('Failed to send data. Error: ${response.statusCode} ${response.reasonPhrase}');

                        // Optionally, handle the error case
                       } // Your API endpoint
              },
              child: Text('Save'),
            ),

            
          ],
        ),
      ),
    );
  }
}
