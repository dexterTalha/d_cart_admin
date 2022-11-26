import 'package:d_cart_admin/model/menu_model.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

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
    return AnimatedContainer(
      width: (isExpanded ?? true) ? size.width * 0.2 : 100,
      duration: const Duration(
        milliseconds: 300,
      ),
      child: Container(
        color: MyTheme.drawerBackgroundColor,
        child: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (_, index) {
            MenuModel m = menuList[index];
            if (m.icon == null) {
              return (isExpanded ?? true)
                  ? Text(
                      m.title ?? "",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text("--");
            }
            return Row(
              children: [
                Icon(m.icon),
                Text(m.title ?? "NA"),
              ],
            );
          },
        ),
      ),
    );
  }
}
