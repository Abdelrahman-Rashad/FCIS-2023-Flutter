// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
    Course({
        this.id,
        this.name,
        this.abb,
        this.doctorName,
        this.doctorEmail,
        this.deps,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? name;
    String? abb;
    String? doctorName;
    String? doctorEmail;
    List<String>? deps;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        name: json["name"],
        abb: json["abb"],
        doctorName: json["doctorName"],
        doctorEmail: json["doctorEmail"],
        deps: List<String>.from(json["deps"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "abb": abb,
        "doctorName": doctorName,
        "doctorEmail": doctorEmail,
        "deps": List<dynamic>.from(deps!),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

//enum Dep { SC, IS, CSYS, CS }


