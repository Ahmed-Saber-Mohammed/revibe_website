import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 && 
           MediaQuery.of(context).size.width < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 40.0;
    return 80.0;
  }

  static double getResponsiveFontSize(BuildContext context, double desktopSize) {
    if (isMobile(context)) return desktopSize * 0.7;
    if (isTablet(context)) return desktopSize * 0.85;
    return desktopSize;
  }
}