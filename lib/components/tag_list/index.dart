import 'package:codefather_app/constants/colors.dart';
import 'package:flutter/material.dart';

/// 标签集合
class TagList extends StatelessWidget {
  final List<String> tags;
  final double spacing;
  final double runSpacing;
  const TagList(
      {super.key, required this.tags, this.spacing = 8, this.runSpacing = 8});

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return const SizedBox();
    }
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: tags
          .map(
            (tag) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                color: tertiaryColor.withOpacity(.05),
                child: Text(
                  tag,
                  style: const TextStyle(color: tertiaryColor),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
