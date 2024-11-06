import 'dart:math';

import 'package:codefather_app/constants/colors.dart';
import 'package:flutter/material.dart';

/// 标签集合
class TagList extends StatelessWidget {
  final List<String> tags;
  final double spacing; // 每个标签的左右边距【margin效果】
  final double runSpacing; // 每个标签的上下边距【margin效果】
  final double fontSize; // 每个子标签的字体大小
  final EdgeInsetsGeometry? itemPadding; // 每个子标签的内边距
  final int? max; // 最多渲染多少个标签

  const TagList({
    super.key,
    required this.tags,
    this.spacing = 8,
    this.runSpacing = 8,
    this.fontSize = 14,
    this.itemPadding,
    this.max,
  });

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return const SizedBox();
    }
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: tags
          .sublist(0, max == null ? tags.length : min(tags.length, max!))
          .map(
            (tag) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Container(
                padding: itemPadding ??
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                color: tertiaryColor.withOpacity(.05),
                child: Text(
                  tag,
                  style: TextStyle(color: tertiaryColor, fontSize: fontSize),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
