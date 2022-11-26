import 'package:flutter/material.dart';

class MenuModel {
  final String? title;
  final List<dynamic>? child;
  final IconData? icon;
  MenuModel({
    this.title,
    this.child,
    this.icon,
  });

  factory MenuModel.fromJson(Map<String, dynamic> map) {
    return MenuModel(
      title: map['title'],
      child: map['child'],
      icon: map['icon'],
    );
  }
}
