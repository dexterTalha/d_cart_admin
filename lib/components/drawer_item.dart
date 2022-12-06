import 'package:d_cart_admin/providers/dashboard_provider.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  final int? id;
  final bool isExpanded;
  final String? title;
  final IconData? leading;
  final Function(int?)? onTap;

  const DrawerItem({Key? key, this.id, this.title, this.onTap, this.leading, this.isExpanded = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return Tooltip(
          message: isExpanded ? "" : title ?? "",
          preferBelow: false,
          margin: const EdgeInsets.only(left: 80),
          decoration: BoxDecoration(
            color: MyTheme.drawerSelectedBackColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
            child: InkWell(
              onTap: () {
                ref.setActiveDrawer(id ?? 0);
                if (onTap != null) onTap!(id);
              },
              onHover: (b) {
                ref.setActiveHoverDrawer(b ? id! : 0);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ref.activeHoverDrawerIndex == id || ref.activeDrawerIndex == id ? MyTheme.drawerSelectedBackColor : null,
                ),
                child: isExpanded
                    ? Row(
                        children: [
                          Icon(
                            leading,
                            color: ref.activeHoverDrawerIndex == id || ref.activeDrawerIndex == id ? MyTheme.drawerActiveTextColor : Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              title ?? "",
                              style: TextStyle(
                                fontSize: 13,
                                color: ref.activeHoverDrawerIndex == id || ref.activeDrawerIndex == id ? MyTheme.drawerActiveTextColor : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        leading,
                        color: ref.activeHoverDrawerIndex == id || ref.activeDrawerIndex == id ? MyTheme.drawerActiveTextColor : Colors.white,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
