import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';

class Toast {
  static error(text) {
    return showToast(
      text,
      context: Get.context!,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      position: StyledToastPosition.top,
      toastHorizontalMargin: 80,
      fullWidth: true,
      animation: StyledToastAnimation.slideFromTopFade,
      curve: Curves.easeIn,
      reverseAnimation: StyledToastAnimation.slideFromBottom,
      backgroundColor: Colors.red,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  static success(text) {
    return showToast(
      text,
      context: Get.context!,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      position: StyledToastPosition.top,
      toastHorizontalMargin: 80,
      fullWidth: true,
      animation: StyledToastAnimation.slideFromTopFade,
      curve: Curves.easeIn,
      reverseAnimation: StyledToastAnimation.slideFromBottom,
      backgroundColor: Colors.green,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}
