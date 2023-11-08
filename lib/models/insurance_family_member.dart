// To parse this JSON data, do
//
//     final insuredFamilyMember = insuredFamilyMemberFromJson(jsonString);

import 'dart:convert';

List<InsuredFamilyMember> insuredFamilyMemberFromJson(String str) => List<InsuredFamilyMember>.from(json.decode(str).map((x) => InsuredFamilyMember.fromJson(x)));

String insuredFamilyMemberToJson(List<InsuredFamilyMember> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsuredFamilyMember {
    int id;
    String? familyMemberImage;
    String name;
    String relationship;
    DateTime fDateOfBirth;
    String fSex;
    int insurancePerson;

    InsuredFamilyMember({
        required this.id,
        required this.familyMemberImage,
        required this.name,
        required this.relationship,
        required this.fDateOfBirth,
        required this.fSex,
        required this.insurancePerson,
    });

    factory InsuredFamilyMember.fromJson(Map<String, dynamic> json) => InsuredFamilyMember(
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
