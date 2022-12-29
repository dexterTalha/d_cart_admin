import 'package:d_cart_admin/components/text_widget.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';

class DashboardMajorStatsBlock extends StatelessWidget {
  final Color? color;
  final String? count;
  final String? title;
  final String? asset;
  final int? index;
  const DashboardMajorStatsBlock({Key? key, this.color, this.count, this.title, this.asset, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (color ?? MyTheme.dashboard_1).withOpacity(0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Image.asset(
                "png/dashboard/$index.png",
                height: 30,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextWidget(
              text: count ?? "10",
              size: 20,
              fontWeight: FontWeight.w600,
              color: color ?? MyTheme.dashboard_1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextWidget(
              text: title ?? "My title",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
