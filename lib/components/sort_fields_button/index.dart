import 'package:codefather_app/utils/color.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 排序按钮
class SortFieldsButton extends StatelessWidget {
  final List<Map<String, dynamic>> sortFields;
  final Map<String, dynamic> curSortField;
  final Function(Map<String, dynamic> sortField)? onSortFieldChange;

  const SortFieldsButton(
      {super.key,
      required this.sortFields,
      required this.curSortField,
      this.onSortFieldChange});

  @override
  Widget build(BuildContext context) {
    return _buildActions();
  }

  _buildActions() {
    return Container(
      color: Get.theme.colorScheme.onPrimary,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
      child: Obx(() {
        final children = sortFields.map<Widget>(
          (tab) {
            final fristWidget = sortFields.indexOf(tab) == 0;
            // 是否应该高亮
            final isActive = curSortField["label"] == tab["label"];

            return GestureDetector(
              onTap: () {
                if (tab["label"] == curSortField["label"]) {
                  return;
                }
                onSortFieldChange?.call(tab);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isActive
                      ? getPrimaryColor().withOpacity(.2)
                      : getShallowTertiaryColor(.05),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                margin: EdgeInsets.only(left: fristWidget ? 0 : 8),
                child: Text(
                  tab["label"].toString(),
                  style: TextStyle(
                      color: isActive ? getPrimaryColor() : getTertiaryColor()),
                ),
              ),
            );
          },
        ).toList();
        return Row(children: children);
      }),
    );
  }
}
