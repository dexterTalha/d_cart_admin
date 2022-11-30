import 'package:d_cart_admin/model/menu_model.dart';
import 'package:d_cart_admin/providers/dashboard_provider.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'drawer_heading_text.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  final List<MenuModel> menuList;
  const DrawerWidget({Key? key, this.isExpanded, required this.menuList}) : super(key: key);

  /*
  * dashboard POS
  * //heading ==> 1. Order Management
  * 2. Parcel Management
  * 3. Item Management
  * 4. Store Management
  * 5. Delivery Man Management
  * */

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return AnimatedContainer(
          width: (isExpanded ?? true) ? size.width * 0.2 : 80,
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Container(
            color: MyTheme.drawerBackgroundColor,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                DrawerItem(
                  title: "Dashboard",
                  leading: Icons.home_outlined,
                  id: 1,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItem(
                  title: "POS",
                  leading: Icons.shopping_basket_outlined,
                  id: 2,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerHeadingText(
                  title: "order management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 10),
                DrawerItem(
                  title: "Orders",
                  leading: Icons.shopping_cart,
                  id: 3,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItem(
                  title: "Order Refunds",
                  leading: Icons.receipt_long,
                  id: 4,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItem(
                  title: "Dispatch",
                  leading: Icons.speed_sharp,
                  id: 5,
                  isExpanded: isExpanded ?? false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
