import 'package:flutter/material.dart';
import 'package:rd_vote/utils/colors.dart';

SnackBar snackbarError(String msg) {
  return SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating, backgroundColor: myColor.errorColor, duration: const Duration(milliseconds: 1500),);
}