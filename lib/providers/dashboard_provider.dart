import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  bool _isDrawerExpanded = true;
  bool _isMobileDrawerOpen = false;

  bool get isDrawerExpanded => _isDrawerExpanded;
  bool get isMobileDrawerOpen => _isMobileDrawerOpen;

  void toggleExpansion({bool? value}) {
    print("DASHBOARD");
    _isDrawerExpanded = value ?? !_isDrawerExpanded;
    notifyListeners();
  }

  void toggleMobileExpansion({bool? value}) {
    _isMobileDrawerOpen = value ?? !_isMobileDrawerOpen;
    notifyListeners();
  }
}
