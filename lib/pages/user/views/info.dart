// import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 用户资料页
class UserInfoView extends StatefulWidget {
  // final UserModel? user;
  const UserInfoView({super.key /* , this.user */});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    AuthService authService = Get.find<AuthService>();
    final userData = authService.userVo.value;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildInfoSection('基本信息', [
            {'label': '性别', 'value': (userData.gender == 1 ? "男" : "女")},
            {'label': '简介', 'value': userData.userProfile ?? "暂无"},
            {'label': '手机', 'value': userData.phone ?? "暂无"},
            {'label': '邮箱', 'value': userData.email ?? "暂无"},
            {'label': '地区', 'value': '${userData.place ?? "暂无"}'},
            {'label': '生日', 'value': formatDateTimeStr(userData.birthday, format: "yyyy-MM-dd")},
          ]),
          buildInfoSection('学习信息', [
            {'label': '兴趣', 'value': userData.interests?.join(",") ?? '暂无'},
            {'label': '主攻方向', 'value': userData.direction ?? "暂无"},
            {'label': '目标', 'value': userData.goal ?? '暂无'},
          ]),
          buildInfoSection('教育信息', [
            {'label': '学校', 'value': userData.school ?? "暂无"},
            {'label': '专业', 'value': userData.major ?? "暂无"},
            {'label': '学历', 'value': userData.education ?? "暂无"},
            {'label': '毕业年份', 'value': '${userData.graduationYear ?? "暂无"}'},
          ]),
          buildInfoSection('职业信息', [
            {'label': '工作状态', 'value': userData.jobStatus ?? "暂无"},
            {'label': '公司', 'value': userData.company ?? "暂无"},
            {'label': '岗位', 'value': userData.job ?? "暂无"},
            {'label': '工作年限', 'value': '${userData.workYear ?? 0}年'},
          ]),
          buildInfoSection('其他', [
            {'label': '用户 id', 'value': userData.id ?? "暂无"},
            {'label': '星球编号', 'value': '暂无'},
            {'label': '注册时间', 'value': formatDateTimeStr(userData.createTime)},
          ]),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildInfoSection(String title, List<Map<String, String>> info) {
    AuthService authService = Get.find<AuthService>();

    return Card(
      elevation: 2.0,
      // color: ThemeUtils.getBackgroundColor(context),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/user/edit',
                            arguments: {'userId': authService.userVo.value.id});
                      },
                      child: const Text('编辑',
                          style: TextStyle(color: Colors.blue)))
                ],
              ),
            ),
            ...info.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item['label'] ?? ''),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: Text(
                      item['value'] ?? '暂无',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
