import 'package:flutter/material.dart';

class Constants {
  static final data = [
    {"title": "Dashboard", "child": [], "icon": Icons.home_outlined},
    {"title": "POS", "child": [], "icon": Icons.shopping_basket_outlined},
    {
      "title": "Order Management",
      "child": [
        {"title": "Orders", "child": [], "icon": Icons.shopping_cart},
        {"title": "Order Refunds", "child": [], "icon": Icons.receipt_long},
        {"title": "Dispatch", "child": [], "icon": Icons.speed_outlined},
      ],
      "icon": null
    },
  ];
}
