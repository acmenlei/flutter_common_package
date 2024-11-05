
import 'package:flutter/material.dart';
import 'package:codefather_app/constants/colors.dart';

/// 通用图标按钮【2024-11-04复制】
class CommonIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isOutlined;
  final String? text;
  final String? imagePath; // 新增的参数

  const CommonIconButton({
    this.icon,
    required this.onPressed,
    this.isOutlined = false,
    this.text,
    this.imagePath, // 新增的参数
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: isOutlined
          ? BoxDecoration(
        border: Border.all(color: tertiaryColor.withOpacity(.2)),
        borderRadius: BorderRadius.circular(24.0),
      )
          : null,
      child: isOutlined && text != null
          ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, width: 12.0, height: 12.0) // 显示本地图片
            else if (icon != null)
              Icon(icon, size: 12.0),
            const SizedBox(width: 5.0),
            Text(text!, style: const TextStyle(fontSize: 12.0)),
          ],
        ),
      )
          : IconButton(
        icon: imagePath != null // 显示本地图片
            ? Image.asset(imagePath!)
            : Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}