import 'package:d_cart_admin/model/menu_model.dart';
import 'package:d_cart_admin/providers/dashboard_provider.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_heading_text.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  final List<MenuModel> menuList;
  final void Function()? onTap;
  const DrawerWidget({Key? key, this.onTap, this.isExpanded, required this.menuList}) : super(key: key);

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
    DashboardProvider().setActiveDrawer(DashboardProvider().activeDrawerIndex);
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
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "POS",
                  leading: Icons.shopping_basket_outlined,
                  id: 2,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerHeadingText(
                  title: "order management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItem(
                  title: "Orders",
                  leading: Icons.shopping_cart,
                  id: 3,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Order Refunds",
                  leading: Icons.receipt_long,
                  id: 4,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Dispatch",
                  leading: Icons.speed_sharp,
                  id: 5,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerHeadingText(
                  title: "Parcel Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItem(
                  title: "Parcel Category",
                  leading: Icons.category_outlined,
                  id: 6,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Parcel Orders",
                  leading: Icons.delivery_dining_outlined,
                  id: 7,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Parcel Settings",
                  leading: Icons.settings_applications_outlined,
                  id: 8,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerHeadingText(
                  title: "Item Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItem(
                  title: "Category / Subcategory",
                  leading: Icons.lan_outlined,
                  id: 9,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Attributes",
                  leading: Icons.edit_attributes_outlined,
                  id: 10,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Units",
                  leading: Icons.straighten_rounded,
                  id: 11,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Items",
                  leading: Icons.inventory_2_outlined,
                  id: 12,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerHeadingText(
                  title: "Store Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItem(
                  title: "Store Settings",
                  leading: Icons.store_mall_directory_outlined,
                  id: 13,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerHeadingText(
                  title: "Delivery Man Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItem(
                  title: "Add Delivery Man",
                  leading: Icons.directions_run_outlined,
                  id: 14,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Delivery Man List",
                  leading: Icons.filter_list,
                  id: 15,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                DrawerItem(
                  title: "Reviews",
                  leading: Icons.star_border_outlined,
                  id: 16,
                  isExpanded: isExpanded ?? false,
                  onTap: (index) => onTap,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
