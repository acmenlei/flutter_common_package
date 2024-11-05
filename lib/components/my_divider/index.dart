import 'package:flutter/material.dart';
import 'package:codefather_app/constants/colors.dart';

/// 分割线
class MyDivider extends StatelessWidget {
  final double? margin;
  final bool color;
  const MyDivider({super.key, this.color = false, this.margin = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: margin,
      color: color ? secondaryWhiteColor : null,
    );
  }
}
