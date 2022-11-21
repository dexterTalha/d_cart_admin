import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  const DrawerWidget({Key? key, this.isExpanded}) : super(key: key);

  /*
  * dashboard POS
  * //heading ==> 1. Order Management
  * 2. Parcel Management
  * 3. Item Management
  * 4. Store Management
  * 5. Delivery Man Management
  * */

  /* https://6ammart-admin.6amtech.com/admin
  TODO: CREATE JSON FOR DRAWER
  {
  "data": [
    {
      "title": "Dashboard",
      "child": [],
      "icon": ""
    },
    {
      "title": "POS",
      "child": [],
      "icon": ""
    },
    {
      "title": "Order Management",
      "child": [
        {
          "title": "Orders",
          "icon": ""
        },
         {
          "title": "Order Refunds",
          "icon": ""
        },
        {
          "title": "Dispatch",
          "icon": ""
        }
      ],
      "icon": ""
    }
  ]
}
*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      width: (isExpanded ?? true) ? size.width * 0.2 : 100,
      duration: const Duration(
        milliseconds: 300,
      ),
      child: Container(
        color: MyTheme.drawerBackgroundColor,
        child: Container(),
      ),
    );
  }
}
