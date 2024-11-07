import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';

// 分段控制器
class Segmented extends StatefulWidget {
  final List<String> items;
  final Function(int selectIndex)? onChange;
  final double tabWidth; // 子tab宽度
  final double tabHeight; // 子tab高度
  final int initialIndex; // 默认tab

  const Segmented(
      {super.key,
      required this.items,
      this.onChange,
      this.tabWidth = 44,
      this.tabHeight = 28,
      this.initialIndex = 0});

  @override
  _SegmentedState createState() => _SegmentedState();
}

class _SegmentedState extends State<Segmented> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: tertiaryColor.withOpacity(.05),
          ),
          height: widget.tabHeight,
          width: widget.tabWidth * widget.items.length,
          child: Row(
            children: widget.items.map((item) {
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = widget.items.indexOf(item);
                  widget.onChange?.call(_selectedIndex);
                }),
                child: Container(
                  alignment: Alignment.center,
                  width: widget.tabWidth,
                  height: widget.tabHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: _selectedIndex == widget.items.indexOf(item)
                          ? getPrimaryColor()
                          : tertiaryColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 120),
          left: _selectedIndex * widget.tabWidth,
          child: Container(
            width: widget.tabWidth,
            height: widget.tabHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: getPrimaryColor().withOpacity(.15),
            ),
          ),
        ),
      ],
    );
  }
}
