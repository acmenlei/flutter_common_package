import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/utils/auth.dart';
import 'package:flutter/material.dart';

/// 非会员卡片
class NonVipCard extends StatelessWidget {
  final UserModel? user;

  const NonVipCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    if (user?.id == null) {
      return const SizedBox();
    }

    final bool isMy = user?.id == getLoginUser()?.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 96, // Adjust height as necessary
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Add rounded corners
              child: Image.asset(
                'assets/vip/normalCard.webp',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 26,
              left: 20,
              child: Row(
                children: [
                  Text(
                    isMy ? "未开通会员" : "该用户非会员",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 26,
              left: 20,
              child: Text(
                "会员专享项目教程/ 答疑等服务",
                style: TextStyle(color: Colors.black),
              ),
            ),
            if (isMy)
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF43403A), // Background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                        side: const BorderSide(
                            color: Colors.white, width: 1), // White border
                      ),
                      textStyle: const TextStyle(
                        color: Color(0xFFFFECBA), // Text color
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('开通会员'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
