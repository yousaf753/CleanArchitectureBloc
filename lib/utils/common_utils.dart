import 'package:clean_arch_cubit/res/app_colors.dart';
import 'package:clean_arch_cubit/res/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {
  static final CommonUtils _instance = CommonUtils._internal();

  factory CommonUtils() {
    return _instance;
  }

  CommonUtils._internal();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  snackbarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.colorRed,
      content: Text(
        message,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.colorWhite,
              fontSize: AppFontSize.textLarge,
              fontWeight: FontWeight.w700,
            ),
      ),
      action: SnackBarAction(
        label: "Dismiss",
        textColor: AppColors.colorWhite,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
