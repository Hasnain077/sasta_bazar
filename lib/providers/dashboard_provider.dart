import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  bool _isDrawerExpanded = true;
  bool _isMobileDrawerOpen = false;
  bool _isExpanded = true;

  int get activeDrawerIndex => _activeDrawer;

  int get activeHoverDrawerIndex => _activeHoverDrawer;

  bool get isExpanded => _isExpanded;

  bool get isDrawerExpanded => _isDrawerExpanded;

  bool get isMobileDrawerOpen => _isMobileDrawerOpen;

  int _activeDrawer = 1;
  int _activeHoverDrawer = 0;

  void setActiveHoverDrawer(int value) {
    _activeHoverDrawer = value;
    notifyListeners();
  }

  void setActiveDrawer(int value) {
    _activeDrawer = value;
    notifyListeners();
  }

  void toggleExpansion({bool? value}) {
    _isDrawerExpanded = value ?? !_isDrawerExpanded;
    notifyListeners();
  }

  void toggleMobileExpansion({bool? value}) {
    print("hello mobile");
    _isMobileDrawerOpen = value ?? !_isMobileDrawerOpen;
    notifyListeners();
  }

  void isExpandedSwitch({bool? value}) {
    _isExpanded = value ?? !_isExpanded;
    notifyListeners();
  }
}
