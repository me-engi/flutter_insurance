// To parse this JSON data, do
//
//     final insurancePerson = insurancePersonFromJson(jsonString);

import 'dart:convert';

List<InsurancePerson> insurancePersonFromJson(String str) => List<InsurancePerson>.from(json.decode(str).map((x) => InsurancePerson.fromJson(x)));

String insurancePersonToJson(List<InsurancePerson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsurancePerson {
    int id;
    List<FamilyMember> familyMembers;
    String citizenshipImage;
    String? insuredPersonImage;
    String firstName;
    dynamic middleName;
    String lastName;
    String email;
    String phoneNo;
    String address;
    String amountPaid;
    DateTime dateOfInsurance;
    DateTime dateOfBirth;
    String sex;

    InsurancePerson({
        required this.id,
        required this.familyMembers,
        required this.citizenshipImage,
        required this.insuredPersonImage,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.email,
        required this.phoneNo,
        required this.address,
        required this.amountPaid,
        required this.dateOfInsurance,
        required this.dateOfBirth,
        required this.sex,
    });

    factory InsurancePerson.fromJson(Map<String, dynamic> json) => InsurancePerson(
        id: json["id"],
        familyMembers: List<FamilyMember>.from(json["family_members"].map((x) => FamilyMember.fromJson(x))),
        citizenshipImage: json["citizenship_image"],
        insuredPersonImage: json["insured_person_image"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNo: json["phone_no"],
        address: json["address"],
        amountPaid: json["amount_paid"],
        dateOfInsurance: DateTime.parse(json["date_of_insurance"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        sex: json["sex"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "family_members": List<dynamic>.from(familyMembers.map((x) => x.toJson())),
        "citizenship_image": citizenshipImage,
        "insured_person_image": insuredPersonImage,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "phone_no": phoneNo,
        "address": address,
        "amount_paid": amountPaid,
        "date_of_insurance": "${dateOfInsurance.year.toString().padLeft(4, '0')}-${dateOfInsurance.month.toString().padLeft(2, '0')}-${dateOfInsurance.day.toString().padLeft(2, '0')}",
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "sex": sex,
    };
}

class FamilyMember {
    int id;
    String? familyMemberImage;
    String name;
    String relationship;
    DateTime fDateOfBirth;
    String fSex;
    int insurancePerson;

    FamilyMember({
        required this.id,
        required this.familyMemberImage,
        required this.name,
        required this.relationship,
        required this.fDateOfBirth,
        required this.fSex,
        required this.insurancePerson,
    });

    factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
        id: json["id"],
        familyMemberImage: json["family_member_image"],
        name: json["name"],
        relationship: json["relationship"],
        fDateOfBirth: DateTime.parse(json["F_date_of_birth"]),
        fSex: json["F_sex"],
        insurancePerson: json["insurance_person"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "family_member_image": familyMemberImage,
        "name": name,
        "relationship": relationship,
        "F_date_of_birth": "${fDateOfBirth.year.toString().padLeft(4, '0')}-${fDateOfBirth.month.toString().padLeft(2, '0')}-${fDateOfBirth.day.toString().padLeft(2, '0')}",
        "F_sex": fSex,
        "insurance_person": insurancePerson,
    };
}
