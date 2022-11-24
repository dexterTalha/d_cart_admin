import 'package:d_cart_admin/model/menu_model.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    List<MenuModel> menuList = Constants.data.map((e) => MenuModel.fromJson(e)).toList();
    for (MenuModel m in menuList) {
      print(m.title);
    }
    // for (Map<String, dynamic> map in Constants.data) {
    //   MenuModel menuModel = MenuModel.fromJson(map);
    //   menuList.add(menuModel);
    // }

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
