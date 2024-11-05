import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/post_vo_model.dart';
import 'package:codefather_app/components/favour_button/controller.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 点赞按钮
class FavourButton extends StatelessWidget {
  final Axis? axis; // 排版方向
  final PostVoModel? data; // 数据
  final int targetType; // 收藏类型
  final double size;
  final double width;

  const FavourButton({
    super.key,
    this.axis = Axis.vertical,
    this.data,
    this.size = 18,
    this.width = 40,
    required this.targetType,
  });

  @override
  Widget build(BuildContext context) {
    // 初始化收藏数据
    FavourController favourController = FavourController();
    favourController.hasFavour.value = data?.hasFavour ?? false;
    favourController.favourNum.value = data?.favourNum ?? 0;

    Widget child = axis == Axis.vertical
        ? _buildVertical(favourController)
        : _buildHorizontal(favourController);
    return SizedBox(
      width: width,
      child: child,
    );
  }

  // 垂直
  Widget _buildVertical(FavourController favourController) {
    return GestureDetector(
      onTap: () => favourController.onPress(data?.id, targetType),
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                favourController.hasFavour.value
                    ? FontAwesomeIcons.solidStar
                    : FontAwesomeIcons.star,
                color: favourController.hasFavour.value
                    ? getPrimaryColor()
                    : tertiaryColor,
                size: size,
              ),
              Text(
                favourController.favourNum.value.toString(),
                style: TextStyle(
                  color: favourController.hasFavour.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                ),
              )
            ],
          )),
    );
  }

  // 横向
  Widget _buildHorizontal(FavourController favourController) {
    return GestureDetector(
      onTap: () => favourController.onPress(data?.id, targetType),
      child: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: FaIcon(
                  favourController.hasFavour.value
                      ? FontAwesomeIcons.solidStar
                      : FontAwesomeIcons.star,
                  color: favourController.hasFavour.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                  size: size,
                ),
              ),
              Text(
                favourController.favourNum.value.toString(),
                style: TextStyle(
                  color: favourController.hasFavour.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                ),
              )
            ],
          )),
    );
  }
}
