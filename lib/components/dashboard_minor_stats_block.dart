import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/mytheme.dart';
import 'text_widget.dart';

class DashboardMinorStatBlock extends StatelessWidget {
  final int? index;
  final String? title;
  final String? count;
  final Color? backgroundColor;
  const DashboardMinorStatBlock({super.key, this.index, this.title, this.count, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, cons) {
      return Container(
        // width: cons.maxWidth <= 360 ? cons.maxWidth : (cons.maxWidth * 0.24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyTheme.dashboardMinor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "${kIsWeb ? "" : "assets/"}png/dashboard/statistics/$index.png",
              height: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextWidget(
                text: title ?? "My title",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextWidget(
              text: count ?? "10",
              size: 20,
              fontWeight: FontWeight.w600,
              color: backgroundColor ?? MyTheme.dashboard_1,
            ),
          ],
        ),
      );
    });
  }
}
