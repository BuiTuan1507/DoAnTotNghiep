import 'package:flutter/animation.dart';

class CategoryModel {
  String? id;
  String? name;
  bool? isSelected;
  List<CategoryLv2>? categoryLv2;

  CategoryModel({this.id, this.name, this.isSelected, this.categoryLv2});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isSelected = json['isSelected'];
    if (json['categoryLv2'] != null) {
      categoryLv2 = <CategoryLv2>[];
      json['categoryLv2'].forEach((v) {
        categoryLv2!.add(new CategoryLv2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isSelected'] = this.isSelected;
    if (this.categoryLv2 != null) {
      data['categoryLv2'] = this.categoryLv2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  static List<CategoryModel> listCategory = [
    CategoryModel(
      id: "1",
      name: "Xe may",
      isSelected: false,
      categoryLv2: [
        CategoryLv2(
          id: "1",
          name: "Xe may cu",
          isSelected: false
        ),
        CategoryLv2(
            id: "1",
            name: "Xe may cu",
            isSelected: false
        ),
        CategoryLv2(
            id: "1",
            name: "Xe may cu",
            isSelected: false
        ),
        CategoryLv2(
            id: "1",
            name: "Xe may cu",
            isSelected: false
        ),
      ]
    ),
    CategoryModel(
        id: "1",
        name: "Xe may",
        isSelected: false,
        categoryLv2: [
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
        ]
    ),
    CategoryModel(
        id: "1",
        name: "Xe may",
        isSelected: false,
        categoryLv2: [
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
        ]
    ),
    CategoryModel(
        id: "1",
        name: "Xe may",
        isSelected: false,
        categoryLv2: [
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
          CategoryLv2(
              id: "1",
              name: "Xe may cu",
              isSelected: false
          ),
        ]
    ),
  ];
}

class CategoryLv2 {
  String? id;
  String? name;
  bool? isSelected;

  CategoryLv2({this.id, this.name, this.isSelected});

  CategoryLv2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isSelected'] = this.isSelected;
    return data;
  }
}