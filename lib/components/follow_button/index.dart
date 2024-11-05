import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/components/follow_button/controller.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:get/get.dart';

/// 关注按钮
class FollowButton extends StatelessWidget {
  final UserModel? user;
  final double? height;
  const FollowButton({super.key, this.user, this.height = 30});

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>();
    FollowController followController = FollowController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // 初始化关注状态【在构建完成之后，该回调会执行】
      // 参考文档：https://saw2110.medium.com/understanding-flutters-addpostframecallback-a-practical-guide-b3d3133b6b85
      followController.setInitialFollowStatus(user?.followStatus ?? 0);
    });

    if (authService.userVo.value.id == user?.id) {
      return const SizedBox();
    }

    return SizedBox(
      height: height, // 设置高度
      child: Obx(
        () {
          if (followController.followStatus.value == 0) {
            return _buildFollow(followController);
          } else {
            return followController.followStatus.value == 1
                ? _buildFollowed(followController)
                : _buildEachFollowed(followController);
          }
        },
      ),
    );
  }

  // 关注
  _buildFollow(FollowController followController) {
    return FilledButton(
      onPressed: () => followController.onPress(user?.id ?? ''),
      child: const Text('关注'),
    );
  }

  // 已关注
  _buildFollowed(FollowController followController) {
    return ElevatedButton(
      onPressed: () => followController.onPress(user?.id ?? ''),
      child: const Text('已关注'),
    );
  }

  // 互粉
  _buildEachFollowed(FollowController followController) {
    return ElevatedButton(
      onPressed: () => followController.onPress(user?.id ?? ''),
      child: const Text('已互粉'),
    );
  }
}
