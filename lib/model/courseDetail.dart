import 'dart:convert';

List<CourseDetailModel> courseDetailFromJson(String str) => List<CourseDetailModel>.from(json.decode(str).map((x) => CourseDetailModel.fromJson(x)));

String courseDetailToJson(List<CourseDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseDetailModel {
    CourseDetailModel({
        this.title,
        this.elements,
    });

    String? title;
    List<Element>? elements;

    factory CourseDetailModel.fromJson(Map<String, dynamic> json) => CourseDetailModel(
        title: json["title"],
        elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "elements": List<dynamic>.from(elements!.map((x) => x.toJson())),
    };
}

class Element {
    Element({
        this.icon,
        this.title,
        this.link,
    });

    int? icon;
    String? title;
    String? link;

    factory Element.fromJson(Map<String, dynamic> json) => Element(
        icon: json["icon"],
        title: json["title"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "link": link,
    };
}
