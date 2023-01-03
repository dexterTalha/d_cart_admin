import 'package:d_cart_admin/components/text_widget.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardMajorStatsBlock extends StatelessWidget {
  final Color? color;
  final String? count;
  final String? title;
  final String? asset;
  final int? index;
  const DashboardMajorStatsBlock({Key? key, this.color, this.count, this.title, this.asset, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, cons) {
        return blockUI(context, cons.maxWidth <= 360 ? cons.maxWidth : (cons.maxWidth * 0.24));
      },
    );
  }

  Widget blockUI(BuildContext context, [double width = 200]) {
    return Container(
      width: width,
      height: 150,
      constraints: BoxConstraints(minWidth: width > 360 ? 250 : width),
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
                "${kIsWeb ? "" : "assets/"}png/dashboard/$index.png",
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
