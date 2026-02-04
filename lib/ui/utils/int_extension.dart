import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get verticalSpace => SizedBox(
        height: this.toDouble(),
      );

  SizedBox get horizontalSpace => SizedBox(
        width: this.toDouble(),
      );
}
