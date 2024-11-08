import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/utils/auth.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// 会员卡片
class VipCard extends StatelessWidget {
  final UserModel? user;
  const VipCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    if (user?.id == null) {
      return const SizedBox();
    }

    const Color textColor = Color(0xFFFFF6C0);
    const Color buttonColor = Color(0xFFF4E0B0);
    final bool isMy = user?.id == getLoginUser()?.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
          width: double.infinity,
          height: 96, // Adjust height as necessary
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 0,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10), // Add rounded corners
                  child: Image.asset(
                    'assets/vip/vipCard.webp',
                    width: Get.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/vip/vip.svg',
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isMy ? "编程导航会员" : "该用户为会员",
                            style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    if (isMy)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          backgroundColor:
                              buttonColor, // Updated background color
                          minimumSize: const Size(80, 30), // Fixed size
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                            side: const BorderSide(
                                color: Colors.white, width: 1), // White border
                          ),
                        ),
                        child: const FittedBox(
                          child: Text(
                            '立即续费',
                            style: TextStyle(
                              color: Colors.black, // Updated text color
                              fontSize: 13, // Font size
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 20,
                right: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isMy
                        ? Text(
                            "会员到期: ${formatDateTimeStr(user?.vipExpireTime, format: 'yyyy-MM-dd')}",
                            style: const TextStyle(color: textColor),
                          )
                        : const Text(
                            "会员专享项目教程/答疑等服务",
                            style: TextStyle(color: textColor),
                          ),
                    if (isMy)
                      const Text(
                        "会员中心",
                        style: TextStyle(color: textColor, fontSize: 13),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
